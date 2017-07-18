DROP TRIGGER IF EXISTS `wrk_zakazpk_AI`;
DELIMITER $$
CREATE TRIGGER `wrk_zakazpk_AI` AFTER INSERT ON `wrk_zakazpk` FOR EACH ROW BEGIN
-- Создаём событие "Добавление заявки Пк"
 call ADD_EVENT(20,NEW.ID,'',null);
end