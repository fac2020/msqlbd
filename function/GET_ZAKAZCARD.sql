DROP FUNCTION IF EXISTS GET_ZAKAZCARD;	
DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_ZAKAZCARD`(`INZAKAZ` INT, `INTYPE` TINYINT) RETURNS text CHARSET utf8
    NO SQL
BEGIN
  DECLARE sResult text;
  DECLARE sAdress varchar(255);
  DECLARE sPrice varchar(255);
  DECLARE sRoom varchar(255);
  DECLARE sSquare varchar(255);
  DECLARE sFloor varchar(255);
  DECLARE sFloors varchar(255);
  
  -- Заявка на продажу
  IF (INTYPE = 1)  THEN
    SELECT wzr.FULLADRESS, wzr.CENA+wzr.MYCOMMIS PRICE, wzr.ROOMS, wzr.S_SUM, wzr.FLOOR, wzr.FLOORS INTO sAdress, sPrice, sRoom, sSquare, sFloor, sFloors  FROM wrk_zakazpr wzr where wzr.ID=INZAKAZ;
    SET sResult = concat('Адресс: ',sAdress,' Цена: ',sPrice,' Комнат: ',sRoom, ' Площадь: ',sSquare, ' Этаж: ',sFloor,'/',sFloors);
  END IF;
  RETURN sResult;
END$$
DELIMITER ;