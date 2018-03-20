DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_NORMALPHONE`(`IN_PHONE` VARCHAR(15)) RETURNS varchar(15) CHARSET utf8
    NO SQL
    COMMENT 'Приводит телефон к стандартному виду'
BEGIN
  DECLARE sResult varchar(15);
  IF IN_PHONE REGEXP '(^8[0-9]{10}$)' THEN
    set  sResult = concat('+7', SUBSTRING(IN_PHONE,2));
  ELSE 
    set  sResult =IN_PHONE;
  END IF;
  RETURN sResult; 
END$$
DELIMITER ;