DELIMITER $$
CREATE DEFINER=`stastrjn_r_test`@`localhost` FUNCTION `GET_NEXTAGENT_BATAREYA`(`BATNUM` INT(11), `AGTYPE` TINYINT) RETURNS int(11)
    COMMENT 'Получение следующего агента для батареи при создании новой заявк'
begin 
  DECLARE iresult int(11);
  declare dresult timestamp;
  set iresult = -1;
  select ba.AGENTID, (GET_AGENT_LAST_DATE(ba.AGENTID,AGTYPE)) into iresult, dresult FROM batagent ba where ba.PKID=batnum and ba.ISWRK=1 and ba.AGENTTYPE=agtype order by 2 LIMIT 1;
    
  RETURN iresult;
end$$
DELIMITER ;