DROP TRIGGER IF EXISTS `prlog_AI`;
DELIMITER $$
CREATE TRIGGER `prlog_AI` AFTER INSERT ON `prlog` FOR EACH ROW BEGIN
 -- Завершаем автозадачи, связанные с этой заявкой.
 UPDATE task t set t.ISCOMPLETE=1 where t.ID = NEW.PRID and t.AGENCYID=NEW.AGENCYID;
 -- Создаём событие "Смена статуса заявки Пр"
 call ADD_EVENT(18,NEW.ID,'',null);
END