DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_SYSTEMID`() RETURNS int(11)
    COMMENT 'ID системной учетки reman'
BEGIN
 DECLARE iSYSTEMID int;
 set iSYSTEMID = 32;
 RETURN iSYSTEMID;
END$$
DELIMITER ;