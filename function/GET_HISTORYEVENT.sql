DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_HISTORYEVENT`(`INEVENT` INT) RETURNS text CHARSET utf8
    COMMENT 'Функция, возвращающая описание события по его ID'
BEGIN
DECLARE sResult text;
RETURN sResult;
END$$
DELIMITER ;