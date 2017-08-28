CREATE TRIGGER `sp_events_ai_persona` AFTER INSERT ON `SP_EVENTS`
 FOR EACH ROW BEGIN
-- Добавляем к каждому новому событию (если это не имя группы событий) ответственного, аудитора и сотрудника в качестве пресоналий
 IF (NEW.IDPARENT<>0) THEN
 INSERT INTO SP_EVENT_PERSON (IDEVENT, IDPERSONTYPE) values (NEW.UID,1),(NEW.UID,2),(NEW.UID,6);
 END IF;
 

END