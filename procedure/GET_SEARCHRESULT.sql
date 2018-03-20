DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` PROCEDURE `GET_SEARCHRESULT`(IN `IN_SSTRING` VARCHAR(50), IN `IN_AGENTID` INT)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  declare sTable VARCHAR(255) default '';
  declare sID VARCHAR(255) default '';
  declare iAgency int default GET_AGENCY4AGENT(IN_AGENTID);
  declare sPhone VARCHAR(15);
  declare cur CURSOR FOR select spc.ID from sp_client spc where upper(spc.NAME) = upper(IN_SSTRING) and spc.AGENCYID = iAgency;
  declare CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;  
 
  IF IN_SSTRING REGEXP '.+@.+\\..+' THEN
   -- это электронная почта
   set sID = null;
   select spi.CLIENTID INTO sID 
   from sp_clientinf spi 
   inner join sp_client spc on (spc.ID=spi.CLIENTID)
   where upper(spi.FVALUE) = upper(IN_SSTRING) and spc.AGENCYID = iAgency; 
   IF (not sID is null) then 
     set sTable = 'sp_clients';
	 select sTable,sID;
   END IF;    
  ELSE  
    -- проверяем на наличие букв
    IF IN_SSTRING REGEXP '[а-яА-Яa-zA-Z].+' THEN
	  -- это имя
	  set sID = null;
      Open cur;
      WHILE not done  DO 
	    FETCH cur INTO sID;
		IF (not sID is null) then
          set sTable = 'sp_clients';
          select sTable,sID;
		END IF;  
      END WHILE;
      Close cur;      	  
	ELSE 
      -- проверяем на наличие номера телефона
      IF IN_SSTRING REGEXP '(^\\+[0-9]{11}$)|(^8[0-9]{10}$)' THEN      
        set sPhone = GET_NORMALPHONE(IN_SSTRING);
		set sID = null;
        select spi.CLIENTID INTO sID 
        from sp_clientinf spi 
        inner join sp_client spc on (spc.ID=spi.CLIENTID)
        where spi.FVALUE = sPhone and spc.AGENCYID = iAgency; 
        IF (not sID is null) then 
          set sTable = 'sp_clients';
		  select sTable,sID;  
   	    END IF; 	    
	  ELSE
	    set sID = null;
		-- Ищем в заявках на продажу
        select wpr.ID into sID from wrk_zakazpr wpr where wpr.ID=IN_SSTRING;
        IF (not sID is null) then 
          set sTable = 'wrk_zakazpr';
          select sTable,sID;
   	    END IF;        
		set sID = null;
	    -- Ищем в заявках на покупку
        select wpk.ID into sID from wrk_zakazpk wpk where wpk.ID=IN_SSTRING;
        IF (not sID is null) then 
          set sTable = 'wrk_zakazpk';
          select sTable,sID;
   	    END IF;        	         
	  END IF;  
    END IF;	
  END IF;
END$$
DELIMITER ;