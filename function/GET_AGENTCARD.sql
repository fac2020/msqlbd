DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENTCARD`(`INAGENT` INT) RETURNS text CHARSET utf8
    NO SQL
BEGIN
  DECLARE sResult text;
  DECLARE sName varchar(255);
  DECLARE sPhone varchar(11);
  select IFNULL(sp.NAME,''), IFNULL(sp.CONTACTTEL,'') into sName, sPhone from sp_agent sp where sp.ID=INAGENT; 
  SET sResult = concate('Имя: ',sName,' тел.: ',sPhone);
  RETURN sResult;
END$$
DELIMITER ;