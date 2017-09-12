DELIMITER $$
CREATE DEFINER=`stastrjn_r_test`@`localhost` PROCEDURE `ADD_MESSAGE`(IN `INIDFROM` INT, IN `INIDTO` INT, IN `INBODY` TEXT, IN `INTYPE` TINYINT)
BEGIN
 DECLARE sBODY text;
 /* INTYPE - тип отправляемого сообщения
  * 1 - внутри системы
  * 2 - на электронную почту
  */
 -- Обработка тела сообщения
 SET sBODY = INBODY;
 CASE INTYPE 
    WHEN 1 THEN INSERT INTO messages (IDFROM,IDTO,BODY) values (INIDFROM,INIDTO,sBODY);
    WHEN 2 THEN INSERT INTO messages (IDFROM,IDTO,BODY) values (INIDFROM,INIDTO,sBODY); -- не закончено
 END CASE; 
 
   
END$$
DELIMITER ;