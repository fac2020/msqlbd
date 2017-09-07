DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_HTMLLINK4EVENTSUBJ`(`INEVENTUID` VARCHAR(36)) RETURNS varchar(255) CHARSET utf8
BEGIN
  DECLARE sResult varchar(255);
  DECLARE iSubject int;
  DECLARE sTablename varchar(256);
  -- Получаем данные из события 
  SELECT we.IDSUBJECT, se.TABNAME INTO iSubject,sTablename FROM WRK_EVENTS we inner join SP_EVENTS se on (se.UID=we.IDEVENT) where we.UID=INEVENTUID;

  set sResult = GET_HTMLLINKBYOBJANDTABLE(iSubject,sTablename);
  
  RETURN sResult; 
END$$
DELIMITER ;