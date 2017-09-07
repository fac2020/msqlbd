DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AUDITORID`(`INAGENTID` INT(20)) RETURNS int(20)
    COMMENT 'Возвращает ID аудитора по ID ответственного.'
BEGIN
 DECLARE iAgentid int;
 SELECT sp_agent.PARENT INTO iAgentid FROM sp_agent WHERE sp_agent.ID = INAGENTID;
 RETURN iAgentid;
END$$
DELIMITER ;