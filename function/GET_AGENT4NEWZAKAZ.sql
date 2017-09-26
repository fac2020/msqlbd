DROP FUNCTION IF EXISTS GET_AGENT4NEWZAKAZ;
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_AGENT4NEWZAKAZ`(`INZAKAZPR` INT, `INTYPE` TINYINT, `INFIRMID` INT) RETURNS int(11)
    COMMENT 'Возвращает ID агента, на которого возможно распределить заявку'
BEGIN
  DECLARE iResult int;
  declare dresult timestamp;
  declare pragent int;
  
  IF (INTYPE=1) THEN -- Новая заявка на продажу
    select sa.ID, (GET_AGENT_LAST_DATE(sa.ID,INTYPE)) 
    into iresult, dresult 
    FROM sp_agent sa 
    where sa.FIRMID=INFIRMID and sa.ISWRK=1 and sa.ACTIVE=1 order by 2 LIMIT 1;
  END IF;

  IF (INTYPE=0) THEN -- Новая заявка на покупку
    -- Получаем агента из заявки Пр, если это требуется
    if (INZAKAZPR>0) THEN
      select wpr.AGENTID into pragent from wrk_zakazpr wpr where wpr.ID=INZAKAZPR;
    ELSE  
      set pragent = 0;
    END IF;  
  
    select sa.ID, (GET_AGENT_LAST_DATE(sa.ID,INTYPE)) 
    into iresult, dresult 
    FROM sp_agent sa 
    where sa.FIRMID=INFIRMID and sa.ISWRK=1 and sa.ACTIVE=1 and sa.ID<>pragent order by 2 LIMIT 1;        
  END IF;
  
  -- Если не найден агент - распределяем на агентство.
  IF (iResult is null) THEN set iResult = INFIRMID; END IF;
  
  RETURN iResult;
END$$
DELIMITER ;