DROP FUNCTION `GET_AGENCY4ZAKAZ`;
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENCY4ZAKAZ`(`INZAKAZID` INT, `INZAKAZTYPE` VARCHAR(30)) RETURNS int(11)
    READS SQL DATA
    COMMENT 'Возвращает ID агентства по номеру заявки и типу заявки'
BEGIN
  DECLARE iResult int DEFAULT -1;
  
  CASE INZAKAZTYPE
    WHEN 'wrk_zakazpk' THEN SELECT wpk.FIRMID  INTO iResult FROM wrk_zakazpk wpk where wpk.ID=INZAKAZID;
    WHEN 'wrk_zakazpr' THEN SELECT wpr.FIRMID INTO iResult FROM wrk_zakazpr wpr where wpr.ID=INZAKAZID;
  END CASE;
  RETURN iResult;
END$$
DELIMITER ;