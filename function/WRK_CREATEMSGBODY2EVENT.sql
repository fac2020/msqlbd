DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `WRK_CREATEMSGBODY2EVENT`(`INMSG` TEXT, `INEVENTID` VARCHAR(36)) RETURNS text CHARSET utf8
BEGIN
DECLARE sResult text;
SET sResult = INMSG; 
-- Ссылка на объект
IF (LOCATE('#IDOBJECT', sResult, 1)>0) THEN
 SET sResult = REPLACE(sResult,'#IDOBJECT',GET_HTMLLINK4EVENTSUBJ(INEVENTID));
END IF;  
-- Ссылка на ответственного
IF (LOCATE('#IDAGENT', sResult, 1)>0) THEN
 SET sResult = REPLACE(sResult,'#IDAGENT',GET_HTMLLINK4EVENTPERS(INEVENTID,1));
END IF;  
-- Ссылка на аудитора
IF (LOCATE('#IDAUDIT', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#IDAUDIT',GET_HTMLLINK4EVENTPERS(INEVENTID,2));
END IF;  
-- Ссылка на клиента
IF (LOCATE('#IDCLIENT', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#IDCLIENT',GET_HTMLLINK4EVENTPERS(INEVENTID,3));
END IF;  
-- Ссылка на ответственного 2
IF (LOCATE('#ID2AGENT', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#ID2AGENT',GET_HTMLLINK4EVENTPERS(INEVENTID,4));
END IF;  
-- Ссылка на аудитора 2
IF (LOCATE('#ID2AUDIT', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#ID2AUDIT',GET_HTMLLINK4EVENTPERS(INEVENTID,5));
END IF;  

-- Имя ответственного
IF (LOCATE('#AGENTNAME', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#AGENTNAME',	GET_NAME4EVENTPERS(INEVENTID,1));
END IF;  
-- Имя аудитора
IF (LOCATE('#AUDITNAME', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#AUDITNAME',	GET_NAME4EVENTPERS(INEVENTID,2));
END IF;  
-- Имя клиента
IF (LOCATE('#CLIENTNAME', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#CLIENTNAME',GET_NAME4EVENTPERS(INEVENTID,3));
END IF;  
-- Имя ответственного 2
IF (LOCATE('#2AGENTNAME', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#2AGENTNAME',GET_NAME4EVENTPERS(INEVENTID,4));
END IF;  
-- Имя аудитора 2
IF (LOCATE('#A2UDITNAME', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#A2UDITNAME',GET_NAME4EVENTPERS(INEVENTID,5));
END IF;

-- Ссылка на объекты, связанные с объектом события
IF (LOCATE('#IDSUBOBJECT', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#IDSUBOBJECT',GET_HTML4SUBUBJECT(INEVENTID,1));
END IF;  
  
IF (LOCATE('#ID2SUBOBJECT', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#ID2SUBOBJECT',GET_HTML4SUBUBJECT(INEVENTID,2));
END IF;  
 
-- Карточка заявки
IF (LOCATE('#CARDZAKAZ', sResult, 1)>0) THEN
  SET sResult = REPLACE(sResult,'#CARDZAKAZ',GET_ZAKAZCARD(INEVENTID));
END IF;  

-- Карточка клиента
IF (LOCATE('#CARDCLIENT', sResult, 1)>0) THEN 
 SET sResult = REPLACE(sResult,'#CARDCLIENT',GET_CLIENTCARD(INEVENTID));
END IF;  


-- IF (sResult is null) then set sResult = 'Error CREATEMSGBODY2EVENT'; END IF;
 
RETURN sResult;
END$$
DELIMITER ;