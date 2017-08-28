DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_HTMLLINK4EVENTSUBJ`(`INEVENTUID` VARCHAR(36)) RETURNS varchar(255) CHARSET utf8
    NO SQL
BEGIN
  DECLARE sResult varchar(255);
  DECLARE iSubject int;
  DECLARE sTablename varchar(256);
  -- Получаем данные из события 
  SELECT we.IDSUBJECT, se.TABNAME INTO iSubject,sTablename FROM WRK_EVENTS we inner join SP_EVENTS se on (se.UID=we.IDEVENT) where we.UID=INEVENTUID;

  IF (sTablename='wrk_zakazpr') THEN
    -- set sResult = concat('http://smeets.ru/index.php/wrkzakazpr/',iSubject);
    
    set sResult = concat('<p><a href="http://smeets.ru/index.php/wrkzakazpr/',iSubject,'">', iSubject,'</a> на продажу.</p>');
  END IF;
  RETURN sResult; 
END$$
DELIMITER ;