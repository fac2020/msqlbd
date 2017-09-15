DROP TRIGGER IF EXISTS `wrk_zakazpr_after_upd_tr1`;
DELIMITER $$
CREATE TRIGGER `wrk_zakazpr_after_upd_tr1` AFTER UPDATE ON `wrk_zakazpr`
 FOR EACH ROW BEGIN
-- Связки
-- Переводим связки в архив, если заявка удалена
IF ((old.STATE<>-1) and (new.STATE=-1)) THEN
 update wrk_prpk set wrk_prpk.ARCHIVE=1
 WHERE (wrk_prpk.IDOWN=OLD.ID and wrk_prpk.TYPEOWN=1) or 
 (wrk_prpk.IDALIEN=OLD.ID and wrk_prpk.TYPEALIEN=1);
 -- Событие удаления заявки
  call ADD_EVENT(17,NEW.ID,'',null);
END IF;
-- Возвращаем связки из архива, если заявка восстановлена
IF ((old.STATE=-1) and (new.STATE<>-1)) THEN
 update wrk_prpk set wrk_prpk.ARCHIVE=0
 WHERE (wrk_prpk.IDOWN=OLD.ID and wrk_prpk.TYPEOWN=1) or 
 (wrk_prpk.IDALIEN=OLD.ID and wrk_prpk.TYPEALIEN=1);
END IF;

IF (new.AGENTID <> old.AGENTID) and (old.AGENTID<>GET_AGENCY4ZAKAZ(new.ID,'wrk_zakazpr')) THEN
-- Меняем владельца связки при смене агента на заявке
update wrk_prpk wp set wp.AGENTID = new.AGENTID where wp.AGENTID = old.AGENTID and wp.IDOWN= new.ID;
-- Событие - смена агента
 call ADD_EVENT(15,NEW.ID,'',null);
END IF;

IF (new.AGENTID <> old.AGENTID) and (old.AGENTID=GET_AGENCY4ZAKAZ(new.ID,'wrk_zakazpr')) THEN
-- Событие - распределение агенту
 call ADD_EVENT(14,NEW.ID,'',null);
END IF;


IF (new.CLIENTID <> old.CLIENTID) and (old.CLIENTID = 0) THEN
-- событие привязки клиента к заявке
 call ADD_EVENT(31,NEW.ID,'',null);
END IF;

-- Реклама
-- Снятие с публикации
IF (NEW.STATE=0 and OLD.STATE<>0) THEN
 UPDATE wrk_agencyad wa set wa.ADSTATE = 0 where wa.OBJECTID = NEW.ID;
 -- событие снятия с публикации
  call ADD_EVENT(30,NEW.ID,'',null);
END IF;

-- Постановка на публикацию
IF (NEW.STATE=1 and OLD.STATE<>1) THEN
 UPDATE wrk_agencyad wa set wa.ADSTATE = 1 where wa.OBJECTID = NEW.ID;
 -- событие снятия с публикации
  call ADD_EVENT(31,NEW.ID,'',null);
END IF;

-- Удаление заявки
IF (NEW.STATE=-1 and OLD.STATE<>-1) THEN
 -- удаляем из рекламы
 DELETE FROM wrk_agencyad where OBJECTID = NEW.ID;
 -- Завершаем задачи
 call WRK_CLOSETASK4ZAKAZ(NEW.ID, 'wrk_zakazpr');
 -- событие удаления заявки
call ADD_EVENT(17,NEW.ID,'',null);
END IF;

END
DELIMITER ;