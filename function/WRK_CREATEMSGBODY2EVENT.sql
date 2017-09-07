DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `WRK_CREATEMSGBODY2EVENT`(`INMSG` TEXT, `INEVENTID` VARCHAR(36)) RETURNS text CHARSET utf8
BEGIN
DECLARE sResult text;
SET sResult = INMSG; 
-- Ссылка на объект
SET sResult = REPLACE(sResult,'#IDOBJECT',GET_HTMLLINK4EVENTSUBJ(INEVENTID));

-- Ссылка на ответственного
SET sResult = REPLACE(sResult,'#IDAGENT',GET_HTMLLINK4EVENTPERS(INEVENTID,1));
-- Ссылка на аудитора
SET sResult = REPLACE(sResult,'#IDAUDIT',GET_HTMLLINK4EVENTPERS(INEVENTID,2));
-- Ссылка на клиента
SET sResult = REPLACE(sResult,'#IDCLIENT',GET_HTMLLINK4EVENTPERS(INEVENTID,3));
-- Ссылка на ответственного 2
SET sResult = REPLACE(sResult,'#ID2AGENT',GET_HTMLLINK4EVENTPERS(INEVENTID,4));
-- Ссылка на аудитора 2
SET sResult = REPLACE(sResult,'#ID2AUDIT',GET_HTMLLINK4EVENTPERS(INEVENTID,5));


-- Имя ответственного
SET sResult = REPLACE(sResult,'#AGENTNAME',	GET_NAME4EVENTPERS(INEVENTID,1));
-- Имя аудитора
SET sResult = REPLACE(sResult,'#AUDITNAME',	GET_NAME4EVENTPERS(INEVENTID,2));
-- Имя клиента
SET sResult = REPLACE(sResult,'#CLIENTNAME',GET_NAME4EVENTPERS(INEVENTID,3));
-- Имя ответственного 2
SET sResult = REPLACE(sResult,'#2AGENTNAME',GET_NAME4EVENTPERS(INEVENTID,4));
-- Имя аудитора 2
SET sResult = REPLACE(sResult,'#A2UDITNAME',GET_NAME4EVENTPERS(INEVENTID,5));

-- Ссылка на объекты, связанные с объектом события
SET sResult = REPLACE(sResult,'#IDSUBOBJECT',GET_HTML4SUBUBJECT(INEVENTID,1));
SET sResult = REPLACE(sResult,'#ID2SUBOBJECT',GET_HTML4SUBUBJECT(INEVENTID,2));


RETURN sResult;
END$$
DELIMITER ;