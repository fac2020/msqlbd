DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `WRK_CREATEMSGBODY2EVENT`(`INMSG` TEXT, `INEVENTID` VARCHAR(36)) RETURNS text CHARSET utf8
BEGIN
DECLARE sResult text;
SET sResult = REPLACE(INMSG,'#IDOBJECT',GET_HTMLLINK4EVENTSUBJ(INEVENTID));
RETURN sResult;
END$$
DELIMITER ;