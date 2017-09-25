DROP FUNCTION IF EXISTS GET_POKAZ4ZAKAZPR; 
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_POKAZ4ZAKAZPR`(`ZAKAZPR` INT, `POKAZSTATE` TINYINT, `FROMDATE` DATE, `TODATE` DATE) RETURNS int(11)
    COMMENT 'Возвращает количество показов по заявке на продажу'
BEGIN
  DECLARE iResult int;
  DECLARE dSTART date;
  DECLARE dEND date;
  SELECT IFNULL(FROMDATE,'1978-06-18') INTO dSTART; -- Если не указана начальная дата
  SELECT IFNULL(TODATE,CURRENT_DATE) INTO dEND; -- Если не указана конечная дата

   SELECT count(wp.ID) INTO iResult FROM pokaz wp where wp.PRID = ZAKAZPR and wp.STATE = POKAZSTATE and wp.POKAZTIME>=dSTART and wp.POKAZTIME<=dEND;
   
   SELECT IFNULL(iResult,-1) INTO iResult; -- На всякий случай :)
  RETURN iResult; 
END$$
DELIMITER ;