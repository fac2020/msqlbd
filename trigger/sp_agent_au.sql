CREATE TRIGGER `sp_agent_au` AFTER UPDATE ON `sp_agent`
 FOR EACH ROW BEGIN

-- Смена родителя
IF (old.PARENT<>NEW.PARENT) THEN
 -- Обновляем аудитроа на задачах
 update task tt set tt.AUTHORID = NEW.PARENT WHERE tt.AGENTID=NEW.ID and tt.AUDITORID = OLD.PARENT;
 -- Создаём событие
 call ADD_EVENT(28,NEW.ID,'',null);
END IF;

END