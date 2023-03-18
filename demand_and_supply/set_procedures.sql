-- PROCEDURE AddNewEntrie
-- parameters:
-- @item_id: used to add to the stock's item containing this id
-- @supplier_name: used to add to the stock's item containing this name.
--                 if the supplier was not added before, add a new supplier
-- @n_e: new quantity of this item. it is used in the trigger
--       which updates the new entry in the stock

DROP PROCEDURE IF EXISTS `AddNewEntrie`
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `AddNewEntrie` (IN `item_id` INT,
                                               `supplier_name` VARCHAR(256),
                                                `number_e` INT)
BEGIN
    DECLARE `supplier_id` INT;
    SELECT `id` INTO `supplier_id` FROM `suppliers`
    WHERE `supplier_name` = `name`;
    IF `supplier_id` IS NULL THEN
        INSERT INTO `suppliers` (`name`) VALUES (`supplier_name`)
        SET `supplier_id` = LAST_INSERT_ID();
    END IF;
    INSERT INTO `entry` (`item_id`,
                         `supplier_id`,
                         `number_e`) VALUES (`item_id`,
                                             `supplier_id`,
                                             `number_e`);
END$$
DELIMITER ;

-- PROCEDURE CreateNewOrder
-- parameters:
-- @item_id: used to add a new buy order of the item containing this id
-- @customer_id: used to add to the stock's item containing this name
-- @n_o: quantity demanded of this item. it is used in the trigger
--       which updates the new out in the stock

DROP PROCEDURE IF EXISTS `CreateNewOrder`
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `CreateNewOrder` (IN `item_id` INT,
                                               `customer_id` VARCHAR(256),
                                                `number_o` INT)
BEGIN
    INSERT INTO `order` (`customer_id`,
                         `item_id`,
                         `number_o`) VALUES (`customer_id`,
                                             `item_id`,
                                             `number_o`);
END$$
DELIMITER ;