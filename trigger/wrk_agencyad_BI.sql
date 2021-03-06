CREATE TRIGGER `wrk_agencyad_BI` BEFORE INSERT ON `wrk_agencyad`
 FOR EACH ROW BEGIN
  DECLARE sPHONE varchar(36);
  DECLARE sPARAMUID varchar(36);
  DECLARE sPARAMVALUE varchar(255);
  SELECT su.ID INTO sPARAMUID FROM sp_userprop su WHERE su.NAME='AGENTADPHONE';
  SELECT up.UPVALUE INTO sPARAMVALUE FROM wrk_userprop up WHERE up.UPID=sPARAMUID and up.UID = NEW.AGENCYID;
  IF (sPARAMVALUE = '1') THEN
    SELECT spa.CONTACTTEL INTO sPHONE FROM sp_agent spa WHERE spa.ID = GetAgentByZakaz(NEW.ZAKAZID, NEW.ZAKAZTYPE);
  ELSE
    SELECT spa.CONTACTTEL INTO sPHONE FROM sp_agent spa WHERE spa.ID=NEW.AGENCYID;
  END IF;
  SET NEW.ADPHONE=sPHONE;
END