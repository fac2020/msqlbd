DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` PROCEDURE `ADD_EVENT`(IN `EVENTID` INT, IN `SUBJECTID` INT, IN `ECOMMENT` VARCHAR(1000), IN `EXTRASUBJECT` INT)
    NO SQL
BEGIN
/* EVENTID - ID события из SP_EVENTS
   SUBJECTID - указатель на субъект операции, например №заявки или ID задачи, показа и др.
   ECOMMENT - параметры
   EXTRASUBJECT - указатель на лополнительный субъект операции если необходимо, как правило на парную заявку.
*/
-- Генерим UUID
  DECLARE NEWUID VARCHAR(36);
  set NEWUID = UUID();
-- Добавляем связанные с событием персоналии в WRK_EVENT_PERSON
-- согласно предопределенным в SP_EVENT_PERSON
  call ADD_EVENT_PERS(NEWUID, EVENTID, SUBJECTID);
  -- Добавляем событие
  insert into WRK_EVENTS (UID, IDEVENT, IDSUBJECT, COMMENT) VALUES (NEWUID, EVENTID, SUBJECTID, ECOMMENT);


  
  
END$$
DELIMITER ;
