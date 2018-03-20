DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENCY4AGENT`(`IN_AGENTID` INT) RETURNS int(11)
    COMMENT 'Возвращает ID агентства по ID агента'
BEGIN
  DECLARE iResult int;
  SELECT spa.FIRMID INTO iResult FROM sp_agent spa where spa.ID=IN_AGENTID;
  IF (iResult is null) THEN SET iResult = 0; END IF;

  RETURN iResult;
END$$
DELIMITER ;