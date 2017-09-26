DELIMITER $$
CREATE DEFINER=`stastrjn_r_test`@`localhost` FUNCTION `GET_ZAKAZ4ZAKAZ`(`ZAKAZ` INT, `FROMDATE` DATE, `TODATE` DATE) RETURNS int(11)
    COMMENT 'Возвращает количество заявок, заведенных на заявку на продажу'
BEGIN
  DECLARE iResult int;
  DECLARE dSTART date;
  DECLARE dEND date;
  SELECT IFNULL(FROMDATE,'1978-06-18') INTO dSTART;   
  SELECT IFNULL(TODATE,CURRENT_DATE) INTO dEND; 
  SELECT count(wp.ID) INTO iResult FROM wrk_zakazpk wp where wp.ZAKAZPR = ZAKAZ and wp.ZAKDATE>=dSTART and wp.ZAKDATE<=dEND;     
   SELECT IFNULL(iResult,-1) INTO iResult;   RETURN iResult; 
END$$
DELIMITER ;