DROP FUNCTION IF EXISTS GET_FIRSTPKPRDATE4AGENTNOERK;
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_FIRSTPKPRDATE4AGENTNOERK`(`IDAGENT` INT, `TYPEZ` TINYINT, `WRKSTATE` TINYINT, `DATETYPE` TINYINT, `RANG` TINYINT) RETURNS date
    COMMENT 'Дата самой ранней неотработанной заявки агента'
BEGIN
  DECLARE dresult DATE;
  DECLARE iRang int;
  -- преобразования к значениям каталога
  CASE RANG
    WHEN 1 THEN SET iRang = 34;
    WHEN 2 THEN SET iRang = 35;
    WHEN 3 THEN SET iRang = 36;
    WHEN 4 THEN SET iRang = 37;
  ELSE SET iRang = -1;
  END CASE;
  
  IF (DATETYPE<>0) THEN
    IF (iRang<0) THEN
      select MIN(wpp.DATEMYWORK) into dresult from wrk_prpk wpp where wpp.AGENTID = IDAGENT and wpp.ARCHIVE=0 AND wpp.TYPEOWN=TYPEZ AND wpp.WRKOWN=wrkstate;
	ELSE
      select MIN(wpp.DATEMYWORK) into dresult from wrk_prpk wpp where wpp.AGENTID = IDAGENT and wpp.ARCHIVE=0 AND wpp.TYPEOWN=TYPEZ AND wpp.WRKOWN=wrkstate and wpp.RANGPKPR=iRang;
    END IF;	
  ELSE
    IF (iRang<0) THEN  
      select MIN(wpp.DATECREATE) into dresult from wrk_prpk wpp where wpp.AGENTID = IDAGENT and wpp.ARCHIVE=0 AND wpp.TYPEOWN=TYPEZ AND wpp.WRKOWN=wrkstate;  
	ELSE 
      select MIN(wpp.DATECREATE) into dresult from wrk_prpk wpp where wpp.AGENTID = IDAGENT and wpp.ARCHIVE=0 AND wpp.TYPEOWN=TYPEZ AND wpp.WRKOWN=wrkstate and wpp.RANGPKPR=iRang;  
    END IF;	
  END IF;
  RETURN dresult;
END$$
DELIMITER ;