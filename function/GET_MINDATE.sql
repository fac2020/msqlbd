DELIMITER $$
CREATE DEFINER=`stastrjn_nrn`@`localhost` FUNCTION `GET_MINDATE`(`FIRSTDATE` DATE, `SECONDDATE` DATE) RETURNS date
    NO SQL
    COMMENT 'Возвращает меньшую из двух дат'
BEGIN
  DECLARE dResult date;
  IF ((not FIRSTDATE is null) and (SECONDDATE is not null)) THEN -- Если обе даты не null
    IF (FIRSTDATE>SECONDDATE) THEN -- Если первая больше второй
      SET dResult = SECONDDATE; -- Возвращаем вторую
    ELSE
      SET dResult = FIRSTDATE; -- иначе возвращаем первую
    END IF;
  ELSE -- Если какая-то из дат = null
    IF ((FIRSTDATE is NULL) and (SECONDDATE is not null)) THEN SET dResult = SECONDDATE; END IF; -- Если первая null, а вторая нет - возвращаем вторую
    IF ((FIRSTDATE is not NULL) and (SECONDDATE is null)) THEN SET dResult = FIRSTDATE; END IF; -- Если вторая null, а первая нет - возвращаем первую
    IF ((FIRSTDATE is NULL) and (SECONDDATE is null)) THEN SET dResult = null; END IF; -- Если обе даты = null, то возвращаем null
  
  END IF;
  RETURN dResult;
END$$
DELIMITER ;