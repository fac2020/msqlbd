DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENT_ZAKAZ_COUNT`(`IDAGENT` INT, `TYPEZAK` INT) RETURNS int(11)
    NO SQL
    COMMENT 'Количество активных заявок агента. TYPEZAK 0 = Пк, 1 = Пр'
BEGIN
 DECLARE iresult int;
 set  iresult = -1;
 -- Покупка
 IF (TYPEZAK = 0) THEN
  select count(wpk.ID) into iresult FROM wrk_zakazpk wpk where wpk.AGENTID = IDAGENT and wpk.STATE in (0,1);
 END IF;
-- Продажа
 IF (TYPEZAK = 1) THEN
  select count(wpk.ID) into iresult FROM wrk_zakazpr wpk where wpk.AGENTID = IDAGENT and wpk.STATE in (0,1);
 END IF;
RETURN iresult;
END$$
DELIMITER ;