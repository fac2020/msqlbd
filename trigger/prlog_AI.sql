DROP TRIGGER IF EXISTS `prlog_AI`;
DELIMITER $$
CREATE TRIGGER `prlog_AI` AFTER INSERT ON `prlog` FOR EACH ROW BEGIN
 -- Создаём событие "Добавление заявки Пр"
 call ADD_EVENT(18,NEW.ID,'',null);
END