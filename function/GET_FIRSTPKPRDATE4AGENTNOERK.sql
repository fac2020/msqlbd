DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_FIRSTPKPRDATE4AGENTNOERK`(`IDAGENT` INT, `TYPEZ` TINYINT) RETURNS date
    COMMENT 'Дата самой ранней неотработанной заявки агента'
BEGIN
  DECLARE dresult DATE;
  select MIN(wpp.DATECREATE) into dresult from wrk_prpk wpp where wpp.AGENTID = IDAGENT and wpp.ARCHIVE=0 AND wpp.WRKOWN=0 and wpp.TYPEOWN=TYPEZ;
  RETURN dresult;
END$$
DELIMITER ;