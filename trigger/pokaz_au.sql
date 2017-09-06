CREATE TRIGGER `pokaz_au` AFTER UPDATE ON `pokaz`
 FOR EACH ROW BEGIN
 -- Закрываем назначеные СИСТЕМОЙ задачи по показу 
 UPDATE task ts set ts.ISCOMPLETE=1 where ts.SUBJECTID = NEW.ID and ts.TABNAME='pokaz' and ts.AUTHORID = GET_SYSTEMID;

END