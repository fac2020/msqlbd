DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GetAgentByZakaz`(`INZAKAZID` INT, `INZAKAZTYPE` TINYINT) RETURNS int(11)
    READS SQL DATA
    COMMENT 'Возвращает ID агента по номеру заявки и типу заявки'
BEGIN
  DECLARE iResult int DEFAULT -1;
  
  CASE INZAKAZTYPE
    WHEN 0 THEN SELECT wpk.AGENTID INTO iResult FROM wrk_zakazpk wpk where wpk.ID=INZAKAZID;
    WHEN 1 THEN SELECT wpr.AGENTID INTO iResult FROM wrk_zakazpr wpr where wpr.ID=INZAKAZID;
  END CASE;
  RETURN iResult;
END$$
DELIMITER ;