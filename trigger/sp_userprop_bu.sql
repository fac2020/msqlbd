CREATE TRIGGER `sp_userprop_bu` BEFORE UPDATE ON `sp_userprop`
 FOR EACH ROW BEGIN
 if (NEW.ID<>OLD.ID) THEN
   IF (NEW.ID='') THEN
     set NEW.ID=UUID();
   END IF;
   update wrk_userprop dd set dd.UPID=NEW.ID WHERE dd.UPID = OLD.ID;
 END IF;


END