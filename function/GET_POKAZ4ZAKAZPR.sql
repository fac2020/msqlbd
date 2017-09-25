DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_POKAZ4ZAKAZPR`(`ZAKAZPR` INT, `POKAZSTATE` TINYINT) RETURNS int(11)
    COMMENT 'Возвращает количество показов по заявке на продажу'
BEGIN
  DECLARE iResult int;
  SELECT count(wp.ID) INTO iResult FROM pokaz wp where wp.PRID = ZAKAZPR and wp.STATE = POKAZSTATE;
  IF (iResult is null) then SET iResult =-1; END IF;
  RETURN iResult; 
END$$
DELIMITER ;