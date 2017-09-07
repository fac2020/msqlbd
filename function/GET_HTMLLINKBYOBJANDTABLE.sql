DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_HTMLLINKBYOBJANDTABLE`(`INOBJECT` INT, `INTABLE` VARCHAR(255)) RETURNS varchar(255) CHARSET utf8
    NO SQL
BEGIN
  DECLARE sResult varchar(255) DEFAULT 'Не определено';

  IF (INTABLE='wrk_zakazpr') THEN
    set sResult = concat('<a href="/index.php/wrkzakazpr/',INOBJECT,'">', INOBJECT,'</a> на продажу');
  END IF;

  IF (INTABLE='wrk_zakazpk') THEN
    set sResult = concat('<a href="/index.php/wrkzakazpk/',INOBJECT,'">', INOBJECT,'</a> на покупку');
  END IF;
  
  IF (INTABLE='task') THEN
    set sResult = concat('<a href="/index.php/task/',INOBJECT,'">', INOBJECT,'</a>');
  END IF;
  
   IF (INTABLE='pokaz') THEN
    set sResult = concat('<a href="/index.php/pokaz/',INOBJECT,'">', INOBJECT,'</a>');
  END IF;

  RETURN sResult; 
END$$
DELIMITER ;