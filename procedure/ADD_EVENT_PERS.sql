DELIMITER $$
DROP PROCEDURE IF EXISTS `ADD_EVENT_PERS`;
CREATE DEFINER=`stastrjn_nrn`@`localhost` PROCEDURE `ADD_EVENT_PERS`(IN `EUID` VARCHAR(36), IN `EEVENTID` INT, IN `ESUBJECT` INT)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE iPERSONTYPEID INT;
  DECLARE PERSONID INT;
  DECLARE AUDITID INT;
  DECLARE PERSONID2 INT;
  DECLARE AUDITID2 INT;  
  declare CLIENTID INT;
  declare IRESULT INT;
  declare ZAKAZPR INT;
  declare ZAKAZPK INT;
  
  DECLARE sourcetable varchar (255);
  DECLARE cur CURSOR FOR SELECT IDPERSONTYPE FROM SP_EVENT_PERSON where IDEVENT=EEVENTID;  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  

  OPEN cur;
  read_loop: LOOP
    SET ZAKAZPR = -1; 
    SET ZAKAZPK = -1;
    SET PERSONID = -1; 
    SET AUDITID = -1;
    SET PERSONID2 = -1; 
    SET AUDITID2 = -1;	
    SET CLIENTID = -1;
    SET IRESULT = -1;
   
    FETCH cur INTO iPERSONTYPEID;
    IF done THEN LEAVE read_loop; END IF;
    IF (iPERSONTYPEID in (1,2,4,5)) THEN  
    
      
      select se.TABNAME into sourcetable from SP_EVENTS se where se.UID=EEVENTID;
      
     -- Определение ответственного
      CASE sourcetable  
       WHEN 'wrk_zakazpr' THEN  
         select wz.AGENTID into PERSONID from wrk_zakazpr wz where wz.ID=ESUBJECT;
       WHEN 'wrk_zakazpk' THEN 
         select wz.AGENTID into PERSONID from wrk_zakazpk wz where wz.ID=ESUBJECT;
       WHEN 'sp_agent' THEN 
         set PERSONID = ESUBJECT;
       WHEN 'task' THEN 
          select ts.AGENTID into PERSONID from task ts where ts.ID=ESUBJECT;    
       WHEN 'prlog' THEN 
          select zz.AGENTID into PERSONID from wrk_zakazpr zz where zz.ID IN (SELECT pl.PRID from prlog pl where pl.ID=ESUBJECT);
       WHEN 'wrk_ipotekarequest' THEN    
          SELECT wz.AGENTID into PERSONID FROM wrk_zakazpr wz WHERE wz.ID in (select wi.OBJECTID from wrk_ipotekarequest wi where wi.ID = ESUBJECT);
		  
       WHEN 'pokaz' THEN  
	   BEGIN
         select pk.PRID, pk.PKID into ZAKAZPR,ZAKAZPK from pokaz pk where pk.ID=ESUBJECT;
          -- call ADD_2TMPDEBUGLOG(concat('ZAKAZPR ',ZAKAZPR)); -- Отладка!
          -- call ADD_2TMPDEBUGLOG(concat('ZAKAZPK ',ZAKAZPK)); -- Отладка!
		 select wzr.AGENTID into PERSONID2 from wrk_zakazpr wzr where wzr.ID=ZAKAZPR;
		 select wzk.AGENTID into PERSONID from wrk_zakazpk wzk where wzk.ID=ZAKAZPK;      
		END;  
      END CASE;      
     

   -- Определение аудитора по ответственному
    if (PERSONID > 0) then SELECT sp.PARENT into AUDITID FROM  sp_agent sp where sp.ID=PERSONID; else set AUDITID = -1; END IF;
	if (PERSONID2 > 0) then SELECT sp2.PARENT into AUDITID2 FROM  sp_agent sp2 where sp2.ID=PERSONID; else set AUDITID2 = -1; END IF;
    END IF;
    
   
   -- Определение клиента
      CASE sourcetable  
       WHEN 'wrk_zakazpr' THEN  
         select wz.CLIENTID into CLIENTID from wrk_zakazpr wz where wz.ID=ESUBJECT;
       WHEN 'wrk_zakazpk' THEN 
         select wz.CLIENTID into CLIENTID from wrk_zakazpk wz where wz.ID=ESUBJECT;
       WHEN 'prlog' THEN 
        select zz.CLIENTID into CLIENTID from wrk_zakazpr zz where zz.ID IN (SELECT pl.PRID from prlog pl where pl.ID=ESUBJECT); 
       WHEN 'wrk_ipotekarequest' THEN 
       select wi.USERID into CLIENTID from wrk_ipotekarequest where wi.ID = ESUBJECT;
       WHEN 'pokaz' THEN 
         select pk.PRID, pk.PKID into ZAKAZPR,ZAKAZPK from pokaz pk where pk.ID=ESUBJECT;
         select wzk.CLIENTID into CLIENTID from wrk_zakazpk wzk where wzk.ID=ZAKAZPK;
      END CASE;    
    
    CASE iPERSONTYPEID
      WHEN 1 THEN SET IRESULT = PERSONID; 
      WHEN 2 THEN SET IRESULT = AUDITID; 
      WHEN 3 THEN SET IRESULT = CLIENTID; 
      WHEN 4 THEN SET IRESULT = PERSONID2; 
      WHEN 5 THEN SET IRESULT = AUDITID2; 	  
	  WHEN 6 THEN SET IRESULT = -1; 
    END CASE; 

       -- call ADD_2TMPDEBUGLOG(concat('PERSONID2 ',PERSONID2)); -- Отладка!
       -- call ADD_2TMPDEBUGLOG(concat('PERSONID ',PERSONID)); -- Отладка!         
       --  call ADD_2TMPDEBUGLOG(concat('AUDITID ',AUDITID)); -- Отладка!
       --  call ADD_2TMPDEBUGLOG(concat('AUDITID2 ',AUDITID2)); -- Отладка!    
/*
   call ADD_2TMPDEBUGLOG(concat('IDEVENT  ',EUID)); -- Отладка!
   call ADD_2TMPDEBUGLOG(concat('IDPERSONTYPE   ',iPERSONTYPEID)); -- Отладка!
   call ADD_2TMPDEBUGLOG(concat('IDSUBJECT ',IRESULT)); -- Отладка!
  */ 
   insert into WRK_EVENT_PERSON (IDEVENT, IDPERSONTYPE, IDSUBJECT) values (EUID,iPERSONTYPEID,IRESULT);
  
  -- Если пользователь системы reman, то создать оповещение
   IF (iPERSONTYPEID in (1,2,4,5,6)) THEN
     call ADD_NOTIFICATION(EUID,IRESULT,'');
   END IF;  
  END LOOP;
 
  CLOSE cur;
END$$
DELIMITER ;