DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` PROCEDURE `ADD_EVENT_PERS`(IN `EUID` VARCHAR(36), IN `EEVENTID` INT, IN `ESUBJECT` INT)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE iPERSONTYPEID INT;
  DECLARE PERSONID INT;
  DECLARE AUDITID INT;
  declare CLIENTID INT;
  declare IRESULT INT;
  DECLARE sourcetable varchar (255);
  DECLARE cur CURSOR FOR SELECT IDPERSONTYPE FROM SP_EVENT_PERSON where IDEVENT=EEVENTID;  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  

  OPEN cur;
  read_loop: LOOP
    SET PERSONID = -1; 
    SET AUDITID = -1;
    SET CLIENTID = -1;
    SET IRESULT = -1;
   
    FETCH cur INTO iPERSONTYPEID;
    IF done THEN LEAVE read_loop; END IF;
    IF (iPERSONTYPEID in (1,2)) THEN  
    -- Определяем исполнителя
      -- Получаем исходную таблицу из SP_EVENTS
      select se.TABNAME into sourcetable from SP_EVENTS se where se.UID=EEVENTID;
      -- Получаем агента из таблицы 
     
      CASE sourcetable  
       WHEN 'wrk_zakazpr' THEN  -- из продажи
         select wz.AGENTID into PERSONID from wrk_zakazpr wz where wz.ID=ESUBJECT;
       WHEN 'wrk_zakazpk' THEN -- из покупки
         select wz.AGENTID into PERSONID from wrk_zakazpk wz where wz.ID=ESUBJECT;
       WHEN 'sp_agent' THEN -- из агентов
         set PERSONID = ESUBJECT;
       WHEN 'task' THEN -- из задач
          select ts.AGENTID into PERSONID from task ts where ts.ID=ESUBJECT;    
       WHEN 'prlog' THEN -- из задач
          select zz.AGENTID into PERSONID from wrk_zakazpr zz where zz.ID IN (SELECT pl.PRID from prlog pl where pl.ID=ESUBJECT);
      END CASE;      
     

   -- Определяем аудитора
    if (PERSONID > 0) then SELECT sp.PARENT into AUDITID FROM  sp_agent sp where sp.ID=PERSONID; else set AUDITID = -1; END IF;
    
    END IF;
    
   -- Определяем клиента 
   -- Получаем клиента из таблицы 
      CASE sourcetable  
       WHEN 'wrk_zakazpr' THEN  -- из продажи
         select wz.CLIENTID into CLIENTID from wrk_zakazpr wz where wz.ID=ESUBJECT;
       WHEN 'wrk_zakazpk' THEN -- из покупки
         select wz.CLIENTID into CLIENTID from wrk_zakazpk wz where wz.ID=ESUBJECT;
       WHEN 'prlog' THEN -- из лога смены статуса Пр
        select zz.CLIENTID into CLIENTID from wrk_zakazpr zz where zz.ID IN (SELECT pl.PRID from prlog pl where pl.ID=ESUBJECT);        
      END CASE;    
    
    CASE iPERSONTYPEID
      WHEN 1 THEN SET IRESULT = PERSONID; -- готовим к добавлению в WRK_EVENT_PERSON исполнителя
      WHEN 2 THEN SET IRESULT = AUDITID; -- готовим к добавлению в WRK_EVENT_PERSON аудитора
      WHEN 3 THEN SET IRESULT = CLIENTID; -- готовим к добавлению в WRK_EVENT_PERSON клиента
    END CASE; 
   
   -- Добавляем запись в WRK_EVENT_PERSON
   insert into WRK_EVENT_PERSON (IDEVENT, IDPERSONTYPE, IDSUBJECT) values (EUID,iPERSONTYPEID,IRESULT);
   -- Добавляем оповещение, если фигурант - исполнитель или аудитор
   IF (iPERSONTYPEID in (1,2)) THEN
     call ADD_NOTIFICATION(EUID,IRESULT,'');
   END IF;  
  END LOOP;
 
  CLOSE cur;
END$$
DELIMITER ;