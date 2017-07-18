DROP TRIGGER IF EXISTS `wrk_zakazpr_AI`;
DELIMITER $$
CREATE TRIGGER `wrk_zakazpr_AI` AFTER INSERT ON `wrk_zakazpr` FOR EACH ROW BEGIN
 -- Создаём событие "Добавление заявки Пр"
 call ADD_EVENT(13,NEW.ID,'',null);
END