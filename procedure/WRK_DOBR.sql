DELIMITER $$
DROP PROCEDURE IF EXISTS `WRK_DOBR`$$
CREATE DEFINER=`stastrjn_nrn`@`localhost` PROCEDURE `WRK_DOBR`(IN `INPERSONTYPEID` INT, IN `INAGENTID` INT, IN `INEVENTPARAMS` INT, IN `INACTIONTYPEID` INT, IN `INACTIONTEMPLATE` TEXT, IN `INACTIONPARAMS` JSON, IN `INEVENTUID` VARCHAR(36), IN `INFIRMID` INT, IN `INSUBJECT` INT, IN `INTABLENAME` VARCHAR(30))
BEGIN
  DECLARE sBody text;  
  DECLARE dSTARTTIME datetime; 
  DECLARE dENDTIME datetime;
  DECLARE dSTIME int; 
  DECLARE dETIME int;
  DECLARE iISAUTO int;
  DECLARE jINACTIONPARAMS json;
  DECLARE sSUBJECT text;
  DECLARE sEMAIL text;
  DECLARE sTablename varchar(255);
  SET sBody = 	WRK_CREATEMSGBODY2EVENT(INACTIONTEMPLATE,INEVENTUID);
  -- Выполняем соответствующее действие
  -- CALL ADD_2TMPDEBUGLOG (concat('Событие ',EVID)); -- ОТЛАДКА!!

    IF (INACTIONTYPEID = 4) THEN
      SET iISAUTO = 1;
    ELSE   
      SET iISAUTO = 0;
    END IF;  


  CASE INACTIONTYPEID 
  WHEN 1 THEN call ADD_MESSAGE(32,INAGENTID,sBody,1); -- Внутрисистемное сообщение
  WHEN 2 THEN -- Письмо на электронную почту
    BEGIN 
      SET sSUBJECT = 'Сообщение от reman.pro';
      CASE 
       WHEN INPERSONTYPEID IN (1,2,4,5,6) THEN SET sTablename = 'sp_agent';
       WHEN INPERSONTYPEID IN (3) THEN SET sTablename = 'sp_client';
      END CASE;

      SET sEMAIL = GET_EMAIL4PERS(INAGENTID,sTablename);
      call 	ADD_EMAIL(sEMAIL,sSUBJECT,sBody);
    END;  
  WHEN 3 THEN
    BEGIN    
    set jINACTIONPARAMS = INACTIONPARAMS;
    set dSTIME = jINACTIONPARAMS->"$.starttime"; 
    set dETIME = jINACTIONPARAMS->"$.endtime";
    IF ((dSTIME > -1) and (dETIME > -1)) THEN    
      set dSTARTTIME = DATE_ADD(CURRENT_TIMESTAMP,INTERVAL dSTIME HOUR);
      set dENDTIME = DATE_ADD(CURRENT_TIMESTAMP,INTERVAL dETIME HOUR);
    ELSE
      -- Если срок начала иили окончания меньше нуля, то получаем эти данные из объекта события
      -- Пока только для показов
      IF (INTABLENAME = 'pokaz' ) THEN
        SELECT pz.POKAZTIME into dSTARTTIME FROM pokaz pz where pz.ID = INSUBJECT;
        set dENDTIME = DATE_ADD(dSTARTTIME,INTERVAL 1 DAY);
      END IF;
          
    END IF;
   /*
   CALL ADD_2TMPDEBUGLOG (concat('jINACTIONPARAMS ',jINACTIONPARAMS)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('dSTIME ',dSTIME)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('dETIME ',dETIME)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('sBody ',sBody)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('dSTARTTIME ',dSTARTTIME)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('dENDTIME ',dENDTIME)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('GET_SYSTEMID() ',GET_SYSTEMID())); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('INAGENTID ',INAGENTID)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('GET_AUDITORID(INAGENTID) ',GET_AUDITORID(INAGENTID))); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('INSUBJECT ',INSUBJECT)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('INTABLENAME ',INTABLENAME)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('iISAUTO ',iISAUTO)); -- ОТЛАДКА!!
   CALL ADD_2TMPDEBUGLOG (concat('INFIRMID ',INFIRMID)); -- ОТЛАДКА!!
   */
   CALL ADD_TASK(sBody,'',dSTARTTIME,dENDTIME,GET_SYSTEMID(),INAGENTID,GET_AUDITORID(INAGENTID),INSUBJECT,INTABLENAME,iISAUTO,INFIRMID);

    END;
  END CASE;
END$$
DELIMITER ;