DROP FUNCTION IF EXISTS GET_ZAKAZCARD;	
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_ZAKAZCARD`(`INEVENT` VARCHAR(255)) RETURNS text CHARSET utf8
    NO SQL
BEGIN
   DECLARE sResult text;

  DECLARE iSubject int;
  DECLARE sTablename varchar(256);
  
  DECLARE sAdress varchar(255);
  DECLARE sPrice varchar(255);
  DECLARE sRoom varchar(255);
  DECLARE sSquare varchar(255);
  DECLARE sFloor varchar(255);
  DECLARE sFloors varchar(255);
  
  DECLARE iZ2Z int;
  DECLARE sCenaMin varchar(255);
  DECLARE sCenaMax varchar(255);
  DECLARE sType varchar(255);
  DECLARE iRoom int;	
  DECLARE iOFF int;
  DECLARE iNFF int;
  DECLARE iNLF int; 
  DECLARE sComment text;
  DECLARE sZ2Z text;
  DECLARE sZakazPr text;
  DECLARE sFloorP varchar(255);
  DECLARE sRoomP varchar(255);
  DECLARE sAgent varchar(255);
  
  

-- Получаем данные из события 
  SELECT we.IDSUBJECT, se.TABNAME INTO iSubject,sTablename FROM WRK_EVENTS we inner join SP_EVENTS se on (se.UID=we.IDEVENT) where we.UID=INEVENT;
 
  -- Заявка на продажу
  IF (sTablename = 'wrk_zakazpr')  THEN
    SELECT wzr.FULLADRESS, wzr.CENA+wzr.MYCOMMIS PRICE, wzr.ROOMS, wzr.S_SUM, wzr.FLOOR, wzr.FLOORS INTO sAdress, sPrice, sRoom, sSquare, sFloor, sFloors  FROM wrk_zakazpr wzr where wzr.ID=iSubject;
    SET sResult = concat('Адрес: ',sAdress,' Цена: ',sPrice,' Комнат: ',sRoom, ' Площадь: ',sSquare, ' Этаж: ',sFloor,'/',sFloors);
  END IF;
  
    -- Заявка на покупку
  IF (sTablename = 'wrk_zakazpk')  THEN
    SELECT wz.ZAKAZPR, wz.CENA, wz.MAXCENA, spo.NAME, wz.ROOMS, wz.ONLYFIRSTFLOOR, wz.NOFIRSTFLOOR, wz.NOLASTFLOOR, IFNULL(wz.COMMENT,'') 
	INTO iZ2Z, sCenaMin, sCenaMax, sType, iRoom, iOFF, iNFF, iNLF, sComment
    FROM wrk_zakazpk wz 
    inner join sp_objecttype spo on (spo.ID=wz.TYPEOBJ)
    WHERE wz.ID=iSubject;    

    -- Этажи"
	SET sFloorP = '';
	IF (iOFF=1) THEN
	  SET sFloorP = ' Только первый этаж.';
	ELSE
	  IF (iNFF=1) THEN SET sFloorP = concat(sFloorP, ' Не первый этаж.'); END IF;
	  IF (iNLF=1) THEN SET sFloorP = concat(sFloorP, ' Не последний этаж.'); END IF;
	END IF;
    
	-- Количество комнат
	SET sRoomP = '';
	IF (sType='Квартира') THEN
	  IF (iRoom = -1) THEN 
	    SET sRoomP = ' Студия'; 
	  ELSE 
	    SET sRoomP = concat(' ',iRoom); 
	  END IF;
	END IF;	
	-- CALL ADD_2TMPDEBUGLOG (concat('sRoomP ',sRoomP)); -- ОТЛАДКА!!
    
	-- Заявка на заявку
	SET sZ2Z = '';
    
	
    IF (iZ2Z>0) THEN
      SELECT wzr.FULLADRESS, wzr.CENA+wzr.MYCOMMIS PRICE, wzr.ROOMS, wzr.S_SUM, wzr.FLOOR, wzr.FLOORS, GET_AGENTCARD(wzr.AGENTID) INTO sAdress, sPrice, sRoom, sSquare, sFloor, sFloors, sAgent  FROM wrk_zakazpr wzr where wzr.ID=iZ2Z;
      SET sZakazPr = concat('Адрес: ',sAdress,' Цена: ',sPrice,' Комнат: ',sRoom, ' Площадь: ',sSquare, ' Этаж: ',sFloor,'/',sFloors);	     
	  SET sZ2Z = concat('На заявку ', sZakazPr, 'Агент по заявке:',sAgent);               
	END IF;	
    SET sResult = concat('Цена от ',sCenaMin,' до ',sCenaMax,'. Тип: ',sType, sRoomP, sFloorP, sZ2Z);    
  END IF;
 
  RETURN sResult;
END$$
DELIMITER ;