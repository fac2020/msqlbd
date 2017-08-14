DELIMITER $$
CREATE DEFINER=`stastrjn_r_test`@`localhost` FUNCTION `GET_CLIENTOFFERS`(`_clientid` INT, `_state` INT) RETURNS int(11)
    READS SQL DATA
BEGIN
        declare proffers, pkoffers int;

    SELECT count(id) into proffers FROM `wrk_zakazpr`
    WHERE `CLIENTID` = _clientid and `STATE` = _state;

    SELECT count(id) into pkoffers FROM `wrk_zakazpk`
    WHERE `CLIENTID` = _clientid and `STATE` = _state;

        return proffers;
END$$
DELIMITER ;
