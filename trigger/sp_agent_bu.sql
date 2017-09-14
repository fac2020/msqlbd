CREATE TRIGGER `sp_agent_bu` BEFORE UPDATE ON `sp_agent`
 FOR EACH ROW BEGIN
  -- Увольнение агента из компании
  IF ((NEW.PARENT=0 and OLD.PARENT<>0) and (NEW.FIRMID=0 and OLD.FIRMID<>0)) THEN
   -- Прописываем роль физлица
   SET NEW.UTYPE=0;
   SET NEW.role='user';
   -- Создаём событие
   call ADD_EVENT(30,NEW.ID,'',null);  
  END IF;
END