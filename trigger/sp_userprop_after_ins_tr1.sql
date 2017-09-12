CREATE TRIGGER `sp_userprop_after_ins_tr1` AFTER INSERT ON `sp_userprop`
 FOR EACH ROW BEGIN
 if (NEW.UTYPE<>-1) then 
   insert into `wrk_userprop` (`UID`, `UPID`, `UPVALUE`)
   select sp.`ID`, NEW.ID, NEW.DEFSTRING 
   from `sp_agent` sp where sp.`UTYPE`=NEW.UTYPE;
 else 
    insert into `wrk_userprop` (`UID`, `UPID`, `UPVALUE`)
   select sp.`ID`, NEW.ID, NEW.DEFSTRING 
   from `sp_agent` sp;
 end if;
END