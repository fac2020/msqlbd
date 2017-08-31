DROP TRIGGER IF EXISTS `wrk_events_bd`;
DELIMITER $$
CREATE TRIGGER `wrk_events_bd` BEFORE DELETE ON `WRK_EVENTS` FOR EACH ROW 
BEGIN 
  -- Каскадное удаление нельзя сделать внешним ключом 
  -- т.к. приходится прописывать персоналии ДО создания события 
  -- для работоспособности бизнес-правил 
  DELETE FROM WRK_EVENT_PERSON where IDEVENT = OLD.UID; 
END