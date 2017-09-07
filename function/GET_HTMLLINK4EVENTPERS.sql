DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_HTMLLINK4EVENTPERS`(`INEVENTUID` VARCHAR(36), `INEVENTPERSTYPE` INT) RETURNS varchar(255) CHARSET utf8
BEGIN
  DECLARE sResult varchar(255);
  DECLARE iPerson int;
  DECLARE sPersonName varchar(255);
  
  -- Получаем данные из персоналий события события 
  IF (INEVENTPERSTYPE in (1,2,4,5)) THEN
    SELECT wep.IDSUBJECT, spa.NAME INTO iPerson,sPersonName FROM WRK_EVENT_PERSON wep 
    INNER JOIN sp_agent spa on (spa.ID=wep.IDSUBJECT)
    WHERE wep.IDEVENT=INEVENTUID and wep.IDPERSONTYPE=INEVENTPERSTYPE;
  END IF;
  
  IF (INEVENTPERSTYPE = 3) THEN
    SELECT wep.IDSUBJECT, spc.NAME INTO iPerson,sPersonName FROM WRK_EVENT_PERSON wep 
    LEFT JOIN sp_client spc on (spc.ID=wep.IDSUBJECT)
    WHERE wep.IDEVENT=INEVENTUID and wep.IDPERSONTYPE=INEVENTPERSTYPE;
  END IF;  
  
  CASE 
    WHEN INEVENTPERSTYPE in (1,2,4,5) THEN set sResult = concat('<a href="/index.php/spagent/',iPerson,'">', sPersonName,'</a>');
    WHEN INEVENTPERSTYPE = 3 THEN set sResult = concat('<a href="/index.php/client/update/',iPerson,'">', sPersonName,'</a>');
    WHEN INEVENTPERSTYPE = 6 THEN set sResult = concat('Сотрудник компании');
  END CASE;  
  IF (sResult is null) then set sResult = 'Нет'; end if;
  
  RETURN sResult; 
END$$
DELIMITER ;