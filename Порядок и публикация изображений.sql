ALTER TABLE `zakazpr_image` ADD `PUBLICFLAG` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Метка публикации изображения' AFTER `THUMBPATH`;
ALTER TABLE `zakazpr_image` ADD `ORDERPOS` INT NOT NULL COMMENT 'Позиция фото' AFTER `PUBLICFLAG`;
