DROP FUNCTION IF EXISTS GET_AGENTPKPR_COLLISION;
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENTPKPR_COLLISION`(`IDAGENT` INT, `ZTYPE` TINYINT) RETURNS int(11)
    COMMENT 'Количество связок агента с коллизиями'
BEGIN
  DECLARE iresult int;
  
    SELECT count(wpp.ID) INTO iresult FROM wrk_prpk wpp 
    where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0
    and ((wpp.WRKOWN<>0) and (wpp.WRKOWN<>wpp.WRKALIEN) and (wpp.WRKALIEN<>0))    
  
RETURN iresult;

END$$
DELIMITER ;