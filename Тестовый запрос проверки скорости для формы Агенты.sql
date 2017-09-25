SELECT
GET_AGENTPKPR_COUNT(ag.ID,1,0,null,-1) NEWPR, -- Неотработанных связок Пр
GET_AGENTPKPR_COUNT(ag.ID,1,0,null,1) NEWPRRANG1,-- Неотработанных связок Пр со "своими"
GET_AGENTPKPR_COUNT(ag.ID,1,0,null,2) NEWPRRANG2,-- Неотработанных связок Пр с "внешними фл"
GET_AGENTPKPR_COUNT(ag.ID,1,0,null,3) NEWPRRANG3, -- Неотработанных связок Пр с "внешними агентствами"
GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,1,0,0,-1) DATEPRNOWRK, -- Дата самой ранней неотработанной связки Пр
GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,1,0,0,1) DATEPRNOWRKRANG1, -- Дата самой ранней неотработанной связки Пр ранг 1
GET_MINDATE(GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,1,0,0,2),GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,1,0,0,3)) DATEPRNOWRKRANG23, -- Дата самой ранней неотработанной связки Пр рангам 2,3
GET_AGENTPKPR_COUNT(ag.ID,1,1,null,-1) PR_1, -- В работе связок Пр
GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,1,1,1,-1) DATEPR_1, -- Дата самой ранней рабочей связки Пр
GET_AGENTPKPR_COUNT(ag.ID,1,-3,CURRENT_DATE,-1) NEWPRDAY, -- Создано сегодня связок Пр
GET_AGENTPKPR_COUNT(ag.ID,1,-2,CURRENT_DATE,-1) WRKPRDAY, -- Отработано сегодня связок Пр
GET_AGENTPKPR_COUNT(ag.ID,0,0,null,-1) NEWPK, -- Неотработанных связок Пк
GET_AGENTPKPR_COUNT(ag.ID,0,0,null,1) NEWPKRANG1, -- Неотработанных связок Пk со "своими"
GET_AGENTPKPR_COUNT(ag.ID,0,0,null,2) NEWPKRANG2, -- Неотработанных связок Пk с "внешними фл"
GET_AGENTPKPR_COUNT(ag.ID,0,0,null,3) NEWPKRANG3, -- Неотработанных связок Пk с "внешними агентствами"
GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,0,0,0,-1) DATEPKNOWRK, -- Дата самой ранней неотработанной связки Пк
GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,0,0,0,1) DATEPKNOWRKRANG1, -- Дата самой ранней неотработанной связки Пк ранг 1
GET_MINDATE(GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,0,0,0,2),GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,1,0,0,3)) DATEPKNOWRKRANG23, -- Дата самой ранней неотработанной связки Пр рангам 2,3
GET_AGENTPKPR_COUNT(ag.ID,0,1,null,-1) PK_1, -- В работе связок Пк
GET_FIRSTPKPRDATE4AGENTNOERK(ag.ID,0,1,1,-1) DATEPK_1, -- Дата самой ранней рабочей связки Пк
GET_AGENTPKPR_COUNT(ag.ID,0,-3,CURRENT_DATE,-1) NEWPKDAY, -- Создано сегодня связок Пк
GET_AGENTPKPR_COUNT(ag.ID,0,-2,CURRENT_DATE,-1) WRKPKDAY -- Отработано сегодня связок Пк
FROM sp_agent ag  WHERE ag.ID in (4,46,49,50,53,54,55,56,57,59);