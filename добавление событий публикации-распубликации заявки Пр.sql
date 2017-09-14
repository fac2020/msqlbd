-- добавление событий
INSERT INTO `SP_EVENTS` (`UID`, `IDPARENT`, `NAME`, `TABNAME`, `PARAMSFLAG`) VALUES
(40, 12, 'Заявка снята с публикации', 'wrk_zakazpr', 0),
(41, 12, 'Заявка опубликована', 'wrk_zakazpr', 0);