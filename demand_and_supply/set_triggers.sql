-- set triggers
-- out: substracts item from stock
-- entry: add stock

DROP TRIGGER IF EXISTS `out`;
CREATE TRIGGER IF NOT EXISTS `out`
AFTER INSERT ON `orders`
FOR EACH ROW 
UPDATE `items`
SET `quantity` = `quantity` - NEW.`number_o`
WHERE `id` = NEW.`item_id`;

DROP TRIGGER IF EXISTS `add_stock`
CREATE TRIGGER IF NOT EXISTS `add_stock`
AFTER INSERT ON `entry`
FOR EACH ROW
UPDATE `item`
SET `quantity` = `quantity` + NEW.`number_e`
WHERE `id` = NEW.`item_id` = `id`
