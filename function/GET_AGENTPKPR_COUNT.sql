DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENTPKPR_COUNT`(`IDAGENT` INT, `ZTYPE` TINYINT, `WRKSTATE` TINYINT, `PKPRDATECREATE` DATE) RETURNS int(11)
    COMMENT 'Количество связок агента'
BEGIN
  DECLARE iresult int;

  IF (PKPRDATECREATE is null) THEN
    select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 and wpp.WRKOWN=WRKSTATE;
  ELSE
    CASE WRKSTATE
	-- Всё отработанное за день
	WHEN -2 THEN select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 and wpp.WRKOWN in (0,1,2,3,4)
      and wpp.DATEMYWORK >= PKPRDATECREATE and wpp.DATEMYWORK <= PKPRDATECREATE+1;      
	-- Созданные за день связки без учета отработки
    WHEN -3 THEN  select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 
      and wpp.DATECREATE >= PKPRDATECREATE and wpp.DATECREATE <= PKPRDATECREATE+1;  
    -- Обычная обработка параметров
	ELSE select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 and wpp.WRKOWN=WRKSTATE 
      and wpp.DATECREATE >= PKPRDATECREATE and wpp.DATECREATE <= PKPRDATECREATE+1;  
      
    END CASE;
  END IF;
RETURN iresult;

END$$
DELIMITER ;