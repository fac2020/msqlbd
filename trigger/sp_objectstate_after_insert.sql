DROP TRIGGER IF EXISTS `sp_objectstate_after_insert`;
DELIMITER $$
CREATE TRIGGER `sp_objectstate_after_insert` AFTER INSERT ON `sp_objectstate`
 FOR EACH ROW BEGIN
-- Добавление в параметры пользователей
DECLARE PUID varchar(36);
SELECT sp_userprop.ID into PUID FROM `sp_userprop` WHERE sp_userprop.NAME='sp_objectstate';
insert into sp_userprop (ID, NAME, UPCOMMENT, UPTYPE, DEFSTRING, UTYPE, PARENTUID) VALUES (NEW.UIDP, NEW.NAME, NEW.NAME, 0, 0, 1, PUID);
-- Добавление в sp_eventsparams
INSERT INTO sp_eventsparams (EVENTID, PARAMID, TABLENAME) VALUES (18,NEW.UID,'sp_objectstate');
END