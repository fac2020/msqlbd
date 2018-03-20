DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_POKAZ4ZAKAZ`(`ZAKAZ` INT, `ZTYPE` INT, `POKAZSTATE` TINYINT, `FROMDATE` DATE, `TODATE` DATE) RETURNS int(11)
    COMMENT 'Возвращает количество показов по заявке'
BEGIN
  DECLARE iResult int;
  DECLARE dSTART date;
  DECLARE dEND date;
  SELECT IFNULL(FROMDATE,'1978-06-18') INTO dSTART; -- Если не указана начальная дата
  SELECT IFNULL(TODATE,CURRENT_DATE) INTO dEND; -- Если не указана конечная дата

  IF (ZTYPE=1) THEN 
   SELECT count(wp.ID) INTO iResult FROM pokaz wp where wp.PRID = ZAKAZ and wp.STATE = POKAZSTATE and wp.POKAZTIME>=dSTART and wp.POKAZTIME<=dEND;
  END IF;

  IF (ZTYPE=0) THEN 
   SELECT count(wp.ID) INTO iResult FROM pokaz wp where wp.PKID = ZAKAZ and wp.STATE = POKAZSTATE and wp.POKAZTIME>=dSTART and wp.POKAZTIME<=dEND;
  END IF;
  
   SELECT IFNULL(iResult,-1) INTO iResult; -- На всякий случай :)
  RETURN iResult; 
END$$
DELIMITER ;