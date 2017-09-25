DROP FUNCTION IF EXISTS GET_AGENTPKPR_COUNT;
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENTPKPR_COUNT`(`IDAGENT` INT, `ZTYPE` TINYINT, `WRKSTATE` TINYINT, `PKPRDATECREATE` DATE, `PKPRRANG` TINYINT) RETURNS int(11)
    COMMENT 'Количество связок агента'
BEGIN
  DECLARE iresult int;
  DECLARE iRang int;
  -- преобразования к значениям каталога
  CASE PKPRRANG
    WHEN 1 THEN SET iRang = 34;
    WHEN 2 THEN SET iRang = 35;
    WHEN 3 THEN SET iRang = 36;
    WHEN 4 THEN SET iRang = 37;
  ELSE SET iRang = -1;
  END CASE;
  
  IF (PKPRDATECREATE is null) THEN -- Если не указана дата
    IF (iRang<0) THEN -- Если нужно все ранги связок
      select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 and wpp.WRKOWN=WRKSTATE;
	ELSE -- Если нужно конкретный ранг связок
	  select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 and wpp.WRKOWN=WRKSTATE and wpp.RANGPKPR=iRang;
	END IF;
  ELSE --  Если указана дата
    IF (iRang<0) THEN -- Если нужно все ранги связок
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
	ELSE -- Если нужно конкретный ранг связок 
      CASE WRKSTATE
	  -- Всё отработанное за день
	  WHEN -2 THEN select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 and wpp.WRKOWN in (0,1,2,3,4)
        and wpp.DATEMYWORK >= PKPRDATECREATE and wpp.DATEMYWORK <= PKPRDATECREATE+1 and wpp.RANGPKPR=iRang;      
	  -- Созданные за день связки без учета отработки
      WHEN -3 THEN  select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 
        and wpp.DATECREATE >= PKPRDATECREATE and wpp.DATECREATE <= PKPRDATECREATE+1 and wpp.RANGPKPR=iRang;  
      -- Обычная обработка параметров
	  ELSE select COUNT(wpp.ID) into iresult from wrk_prpk wpp where wpp.AGENTID=IDAGENT and wpp.TYPEOWN=ZTYPE and wpp.ARCHIVE=0 and wpp.WRKOWN=WRKSTATE 
        and wpp.DATECREATE >= PKPRDATECREATE and wpp.DATECREATE <= PKPRDATECREATE+1 and wpp.RANGPKPR=iRang;        
      END CASE;	  
	END IF;  
  END IF;
RETURN iresult;

END$$
DELIMITER ;