DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_CLIENTCARD`(`INEVENT` VARCHAR(255)) RETURNS text CHARSET utf8
    COMMENT 'Возвращает карточку клиента по ID события'
BEGIN
  DECLARE sResult text;
  DECLARE iSubject int;
  DECLARE sTablename varchar(256);
  DECLARE sName varchar(255);
  DECLARE sContact varchar(255);
  DECLARE iClient int;
    
  -- Получаем данные из события 
  SELECT we.IDSUBJECT, se.TABNAME INTO iSubject,sTablename FROM WRK_EVENTS we inner join SP_EVENTS se on (se.UID=we.IDEVENT) where we.UID=INEVENT;


  -- Заявка на продажу
  IF (sTablename = 'wrk_zakazpr')  THEN
    SELECT wpr.CLIENTID, IFNULL(spc.NAME,'Без имени') INTO iClient, sName 
    FROM wrk_zakazpr wpr 
    inner join sp_client spc on (spc.ID=wpr.CLIENTID)
    WHERE wpr.ID=iSubject;   
    IF (sName is null) THEN SET sName = 'Без Имени'; END IF;
    SELECT IFNULL(sc.FVALUE,'Без контакта') INTO sContact FROM sp_clientinf sc where sc.CLIENTID= iClient;    
    IF (sContact is null) THEN SET sContact = 'Без контакта'; END IF; 
    SET sResult = concat('<b>Имя: </b>',sName,' <b>Контакт:</b> ',sContact);
  END IF;
  
  -- Заявка на покупку
  IF (sTablename = 'wrk_zakazpk')  THEN
    SELECT wpk.CLIENTID, IFNULL(spc.NAME,'Без имени') INTO iClient, sName 
    FROM wrk_zakazpk wpk 
    inner join sp_client spc on (spc.ID=wpk.CLIENTID)
    WHERE wpk.ID=iSubject;    
    IF (sName is null) THEN SET sName = 'Без Имени'; END IF;
    SELECT IFNULL(sc.FVALUE,'Без контакта') INTO sContact FROM sp_clientinf sc where sc.CLIENTID= iClient;       
    IF (sContact is null) THEN SET sContact = 'Без контакта'; END IF;
    SET sResult = concat('<b>Имя: </b>',sName,' <b>Контакт:</b> ',sContact);
  END IF;  
  
  RETURN sResult;
END$$
DELIMITER ;