DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENT_LAST_DATE`(`AGENTID` INT, `AGTYPE` TINYINT) RETURNS timestamp
    COMMENT 'Получение даты последней полученной агентом заявки Пк'
BEGIN
 DECLARE RESDATE TIMESTAMP;
 if (AGTYPE = 0) THEN
   SELECT MAX(wz.ZAKDATE) into RESDATE from wrk_zakazpk wz where wz.AGENTID=AGENTID and wz.STATE>=0;
 ELSE  
   SELECT MAX(wz.ZAKDATE) into RESDATE from wrk_zakazpr wz where wz.AGENTID=AGENTID and wz.STATE>=0; 
 end if;   
 RETURN RESDATE;
END$$
DELIMITER ;