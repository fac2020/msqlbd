DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_EMAIL4PERS`(`INID` INT, `INTABLENAME` INT) RETURNS text CHARSET utf8
    COMMENT 'Возвращает адрес электронной почты по ID и наименованию таблицы'
BEGIN
DECLARE sResult text;
 -- Пользователи
 IF (INTABLENAME = 'sp_agent') THEN
   SELECT sa.EMAIL INTO sResult FROM sp_agent sa where sa.ID=INID;
 END IF;
 
 -- Клиенты
 IF (INTABLENAME = 'sp_client') THEN
   SELECT sc.FVALUE INTO sResult FROM sp_clientinf sc where sc.CLIENTID=INID and sc.TYPEID = 2;
 END IF; 
 
 RETURN sResult;
END$$
DELIMITER ;