insert into `SP_PERSON_TYPE` (UID,NAME,TABNAME) values (6,'Сотрудник компании','sp_agent');

insert into `SP_EVENT_PERSON` (IDEVENT,	IDPERSONTYPE) values (13,6),(15,6),(17,6),(20,6),(22,6),(24,6),(39,6);

insert INTO `sp_persaction` VALUES (6,1),(6,2),(6,3),(6,4);