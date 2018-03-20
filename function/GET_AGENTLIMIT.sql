DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENTLIMIT`(`IN_AGENTID` INT) RETURNS int(11)
    COMMENT 'Остаток суточного лимита'
BEGIN
 DECLARE iResult Int;
 DECLARE iMax Int;
 DECLARE iNow Int;
 SET iResult = 0;
 select al.MAXDAY, al.COUNTDAY into iMax,iNow from agent_limit al where al.ID=IN_AGENTID;
 IF (iMax>0) THEN
   IF (iNow>0) THEN
     SET iResult = iMax - iNow;
   ELSE
     SET iResult = iMax;
   END IF;
 END IF;
 
 Return iResult;
END$$
DELIMITER ;