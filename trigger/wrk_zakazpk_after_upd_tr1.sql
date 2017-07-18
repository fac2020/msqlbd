DROP TRIGGER IF EXISTS `wrk_zakazpk_after_upd_tr1`;
DELIMITER $$
CREATE TRIGGER `wrk_zakazpk_after_upd_tr1` AFTER UPDATE ON `wrk_zakazpk` FOR EACH ROW BEGIN
-- При удалении заявки убираем связки в архив
IF ((old.STATE<>-1) and (new.STATE=-1)) THEN
 update wrk_prpk set wrk_prpk.ARCHIVE=1
 WHERE (wrk_prpk.IDOWN=OLD.ID and wrk_prpk.TYPEOWN=0) or 
 (wrk_prpk.IDALIEN=OLD.ID and wrk_prpk.TYPEALIEN=0);
 -- Создаём событие "Удалена заявка Пк"
 call ADD_EVENT(24,NEW.ID,'',null); 
END IF;
-- При возврате заявки из удаленных, возвращаем связки из архива
IF ((old.STATE=-1) and (new.STATE<>-1)) THEN
 update wrk_prpk set wrk_prpk.ARCHIVE=0
 WHERE (wrk_prpk.IDOWN=OLD.ID and wrk_prpk.TYPEOWN=0) or 
 (wrk_prpk.IDALIEN=OLD.ID and wrk_prpk.TYPEALIEN=0);
END IF;

-- Меняем агента на связках при смене агента на заявке
IF (new.AGENTID <> old.AGENTID) THEN
 update wrk_prpk wp set wp.AGENTID = new.AGENTID where wp.AGENTID = old.AGENTID and wp.IDOWN= new.ID;
 
 -- Создаём событие "Смена агента Пк"
 call ADD_EVENT(22,NEW.ID,'',null);
END IF;

-- Создаём событие "Добавлен клиент Пк"
IF (new.CLIENTID <> old.CLIENTID) and (old.CLIENTID = 0) THEN
 call ADD_EVENT(37,NEW.ID,'',null);
END IF;


END