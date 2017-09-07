DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_HTML4SUBUBJECT`(`INEVENTUID` VARCHAR(255), `SUBOBJNUM` INT) RETURNS varchar(255) CHARSET utf8
    NO SQL
BEGIN
  DECLARE sResult varchar(255) DEFAULT 'Не определено';
  DECLARE iSubject int;
  DECLARE sTablename varchar(256);
  DECLARE sObject int;
  DECLARE sObject2 int;
  DECLARE sSubTablename varchar(256);
  
  
-- Получаем данные из события 
  SELECT we.IDSUBJECT, se.TABNAME INTO iSubject,sTablename FROM WRK_EVENTS we inner join SP_EVENTS se on (se.UID=we.IDEVENT) where we.UID=INEVENTUID;
  
  IF (sTablename='pokaz') THEN
    select pz.PKID, pz.PRID INTO sObject,sObject2 from pokaz pz where pz.ID=iSubject;
    IF (SUBOBJNUM=1) THEN
      set sResult = concat('<a href="/index.php/wrkzakazpk/',sObject,'">', sObject,'</a>');
    ELSE
      set sResult = concat('<a href="/index.php/wrkzakazpr/',sObject2,'">', sObject2,'</a>');    
    END IF;
  END IF;  

  IF (sTablename='task') THEN
    SELECT ts.SUBJECTID, ts.TABNAME INTO sObject,sSubTablename from task ts where ts.ID=iSubject;
    set sResult = GET_HTMLLINKBYOBJANDTABLE(sObject,sSubTablename);
  END IF;


  RETURN sResult; 
END$$
DELIMITER ;