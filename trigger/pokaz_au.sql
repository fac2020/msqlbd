CREATE TRIGGER `pokaz_au` AFTER UPDATE ON `pokaz`
 FOR EACH ROW BEGIN
 -- Закрываем назначеные СИСТЕМОЙ задачи по показу 
 UPDATE task ts set ts.ISCOMPLETE=1 where ts.SUBJECTID = NEW.ID and ts.TABNAME='pokaz' and ts.AUTHORID = GET_SYSTEMID();

-- Событие состоявшегося показа
 IF ((OLD.STATE=0) and (NEW.STATE=1)) THEN
   call ADD_EVENT(10,NEW.ID,'',null);
 END IF;
 
-- Событие не состоявшегося показа
 IF ((OLD.STATE=0) and (NEW.STATE=-1)) THEN
   call ADD_EVENT(11,NEW.ID,'',null);
 END IF;
 
END