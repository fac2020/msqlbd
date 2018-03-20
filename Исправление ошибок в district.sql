-- Исправление ошибок в district 
UPDATE wrk_zakazpr wp set wp.District='Куйбышевский район' WHERE wp.District='поселок Кряж';
UPDATE wrk_zakazpr wp set wp.District='Промышленный район' WHERE wp.District='Барбошина поляна';
UPDATE wrk_zakazpr wp set wp.District='Красноглинский район' WHERE wp.District='поселок Мехзавод';
UPDATE wrk_zakazpr wp set wp.District='Куйбышевский район' WHERE wp.District='поселок Соцгород';
UPDATE wrk_zakazpr wp set wp.District='Волжский район' WHERE wp.District='жилой комплекс Южный Город';
UPDATE wrk_zakazpr wp set wp.District='Куйбышевский район' WHERE wp.District='посёлок Рубежный';
UPDATE wrk_zakazpr wp set wp.District='Красноглинский район' WHERE wp.District='посёлок Красная Глинка';
UPDATE wrk_zakazpr wp set wp.District='Куйбышевский район' WHERE wp.District='поселок 113-й километр';

UPDATE wrk_zakazpr wp set wp.District='Промышленный район' WHERE wp.District='10-й микрорайон';
UPDATE wrk_zakazpr wp set wp.District='Октябрьский район' WHERE wp.District='Мичуринские микрорайоны';
UPDATE wrk_zakazpr wp set wp.District='Железнодорожный район' WHERE wp.District='Мпоселок 6-й Тупик';

  