DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` PROCEDURE `WRK_BR`(IN `EVTYPE` INT, IN `EVSUBJ` INT, IN `EVEXTSUBJ` INT, IN `EVID` VARCHAR(36))
    COMMENT 'Выполнение бизнес-правил'
BEGIN
 DECLARE sTablename VARCHAR(256); -- Имя таблицы, содержащей субъект
 DECLARE iFirmid Int DEFAULT -1; -- ID компании
 DECLARE iFirmid2 Int DEFAULT -1; -- ID компании по связанной заявке
 DECLARE iPRID Int DEFAULT -1; -- ID заявки на продажу
 DECLARE iPKID Int DEFAULT -1; -- ID заявки на покупку
 DECLARE iParamNeed int; -- Необходимость параметра
 DECLARE iParamValue int; -- Параметр события
 DECLARE bWork boolean;
 
 	DECLARE iPERSONTYPEID Int DEFAULT -1; -- Тип персоны в правилах
    DECLARE iAGENTID Int DEFAULT -1; -- ID агента, если не задан тип
    DECLARE iEVENTPARAMS int DEFAULT 0; -- отслуживаемые параметры события (если есть)
    DECLARE iACTIONTYPEID Int DEFAULT -1; -- id типа действия
    DECLARE sACTIONTEMPLATE text; -- шаблон для действя (назв. для задачи, текст для сообщения)
    DECLARE jACTIONPARAMS JSON; -- параметры действия (даты для задачи)
    
 DECLARE done INT DEFAULT FALSE;   
 DECLARE cur CURSOR FOR SELECT wb.PERSONTYPEID, wb.AGENTID, wb.EVENTPARAMS, wb.ACTIONTYPEID, wb.ACTIONTEMPLATE, wb.ACTIONPARAMS FROM wrk_bizrule wb WHERE wb.AGENCYID = iFirmid and wb.IDEVENT = EVTYPE AND wb.ISWRK = 1;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
 -- Получаем тип субъекта
 SELECT se.TABNAME INTO sTablename FROM SP_EVENTS se where se.UID = EVTYPE;
 
 -- Определяем компанию по субъекту
 IF (sTablename='wrk_zakazpr') THEN
   SELECT sa.FIRMID INTO iFirmid FROM sp_agent sa WHERE sa.ID in (SELECT wz.AGENTID FROM wrk_zakazpr wz WHERE wz.ID=EVSUBJ);
 END IF;

 IF (sTablename='wrk_zakazpk') THEN
   SELECT sa.FIRMID INTO iFirmid FROM sp_agent sa WHERE sa.ID in (SELECT wz.AGENTID FROM wrk_zakazpk wz WHERE wz.ID=EVSUBJ);
 END IF;

 IF (sTablename='pokaz') THEN
   SELECT po.PRID, po.PKID INTO iPRID,iPKID FROM pokaz po where po.ID = EVSUBJ;
   SELECT sa.FIRMID INTO iFirmid FROM sp_agent sa WHERE sa.ID in (SELECT wz.AGENTID FROM wrk_zakazpk wz WHERE wz.ID=iPKID);
   SELECT sa.FIRMID INTO iFirmid2 FROM sp_agent sa WHERE sa.ID in (SELECT wz.AGENTID FROM wrk_zakazpr wz WHERE wz.ID=iPRID);
 END IF;

 IF (sTablename='task') THEN
   SELECT ts.AGENCYID INTO iFirmid FROM task ts WHERE ts.ID=EVSUBJ;
 END IF;

 IF (sTablename='prlog') THEN
   SELECT po.PRID, po.NEWSTATE INTO iPRID,iParamValue FROM prlog po where po.ID = EVSUBJ;
   SELECT sa.FIRMID INTO iFirmid FROM sp_agent sa WHERE sa.ID in (SELECT wz.AGENTID FROM wrk_zakazpr wz WHERE wz.ID=iPRID);
 END IF;
 
-- CALL ADD_2TMPDEBUGLOG (concat('iFirmid ',iFirmid)); -- ОТЛАДКА!!
-- CALL ADD_2TMPDEBUGLOG (concat('iFirmid2 ',iFirmid2)); -- ОТЛАДКА!!
 
 -- Получаем список бизнес-правил для компании, соответствующие этому типу события
 OPEN cur;
 read_loop: LOOP
   FETCH cur INTO iPERSONTYPEID,iAGENTID,iEVENTPARAMS,iACTIONTYPEID,sACTIONTEMPLATE,jACTIONPARAMS;  
   IF done THEN LEAVE read_loop; END IF;
   SET bWork = false;
   -- Если тип персоналии НЕ - "Сотрудник компании", то получаем ID персоналии из WRK_EVENT_PERSON  
    IF (iPERSONTYPEID IN (1,2,4,5)) THEN
     SELECT wep.IDSUBJECT INTO iAGENTID FROM WRK_EVENT_PERSON wep WHERE wep.IDEVENT=EVID AND wep.IDPERSONTYPE=iPERSONTYPEID;
    END IF; 
   	
    IF (iEVENTPARAMS<>0) THEN
      IF (iEVENTPARAMS = iParamValue) THEN
        SET bWork = true; 
      END IF;      
    ELSE
     SET bWork = true; 
    END IF;   	

    IF (bWork) THEN
    CALL WRK_DOBR (iPERSONTYPEID,iAGENTID,iEVENTPARAMS,iACTIONTYPEID,sACTIONTEMPLATE,jACTIONPARAMS,EVID,iFirmid,EVSUBJ,sTablename);   
    END IF;  

 END LOOP;
 CLOSE cur;
END$$
DELIMITER ;