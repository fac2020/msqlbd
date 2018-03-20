DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_NEXTAGENT_BATAREYA`(`BATNUM` INT(11), `AGTYPE` TINYINT) RETURNS int(11)
    COMMENT 'Получение следующего агента для батареи при создании новой заявк'
begin
  DECLARE iresult int(11);
  declare dresult timestamp;
  set iresult = -1;
    IF (agtype = 0) THEN
      select ba.AGENTID, (GET_AGENT_LAST_DATE(ba.AGENTID,AGTYPE)) into iresult, dresult FROM batagent ba where ba.PKID=batnum and ba.ISWRK=1 and ba.AGENTTYPE=agtype order by 2 LIMIT 1;
    ELSE 
      select ba.AGENTID, (GET_AGENT_LAST_DATE(ba.AGENTID,AGTYPE)) 
      into iresult, dresult 
      FROM batagent ba
      INNER JOIN agent_limit al on (al.ID=ba.AGENTID  and al.MAXDAY-al.COUNTDAY>0)
      where ba.PKID=batnum and ba.ISWRK=1 and ba.AGENTTYPE=agtype 
      order by 2 LIMIT 1;  
    END IF;
  IF (iresult = -1) THEN SET iresult = GET_AGENCY4ZAKAZ(BATNUM,'wrk_zakazpk'); END IF;
  RETURN iresult;
end$$
DELIMITER ;