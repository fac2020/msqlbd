DROP TRIGGER IF EXISTS `prlog_AI`;
DELIMITER $$
CREATE TRIGGER `prlog_AI` AFTER INSERT ON `prlog` FOR EACH ROW BEGIN
 -- Завершаем автозадачи, связанные с этой заявкой.
 UPDATE task t set t.ISCOMPLETE=1 where t.ID = NEW.PRID and t.AGENCYID=NEW.AGENCYID;
 -- Создаём событие "Смена статуса заявки Пр"
 call ADD_EVENT(18,NEW.ID,'',null);
 IF (NEW.NEWSTATE = 19) THEN -- Если меняем на "Наш объект"
   -- убираем метку "приватный объект", если объект принадлежит этой компании
   update wrk_zakazpr wz set wz.PRIVATEOBJECT = 0 where wz.ID = NEW.PRID and wz.FIRMID = NEW.AGENCYID;
 END IF;
END