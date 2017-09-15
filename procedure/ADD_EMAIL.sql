DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` PROCEDURE `ADD_EMAIL`(IN `INMAIL` TEXT, IN `INSUBJECT` TEXT, IN `INBODY` TEXT)
    COMMENT 'Отправка сообщения по электронной почте'
BEGIN
 DECLARE sBODY text;
 DECLARE sSUBJECT text;
 
 SET sSUBJECT = INSUBJECT;
 SET sBODY = INBODY;
 
 INSERT INTO wrk_mail (email,subject,body,sendtype,success) values (INMAIL,sSUBJECT,sBODY,1,-1);
END$$
DELIMITER ;