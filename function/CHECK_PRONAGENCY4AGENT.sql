DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `CHECK_PRONAGENCY4AGENT`(`INAGENT` INT, `INPR` INT) RETURNS int(11)
    COMMENT 'Проверка принадлежности заявки Пр (для подбора)'
BEGIN
  DECLARE iResult int; 
  DECLARE iAgency int;
  
  select spa.FIRMID INTO iAgency from sp_agent spa where spa.ID=INAGENT;
  if (iAgency is null) then set iAgency = 0; end if;
  
  select count(*) into iResult from wrk_zakazpr wp 
  where wp.ID = INPR 
  and wp.FIRMID = iAgency -- Принадлежит агентству
  and wp.AGENTID = iAgency -- Не рспределено на агентов
  and wp.STATE in (0,1) -- не удалена
  and wp.PRIVATEOBJECT = 1; -- получена из парсинга

  RETURN iResult;
END$$
DELIMITER ;