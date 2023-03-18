-- creates the database and the tables
CREATE TABLE IF NOT EXISTS `customer` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `credit_points` INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `item` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `supplier_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `orders` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `customer_id` INT NOT NULL,
    `item_id` INT NOT NULL,
    `number_o` INT NOT NULL
);

CREATE TABLE IF NOT EXISTS `entry` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `item_id` INT NOT NULL,
    `supplier_id` INT NOT NULL,
    `number_e` INT NOT NULL
)

CREATE TABLE IF NOT EXISTS `suppliers` (
    `id` INT NOT NULL
    `name` VARCHAR(256) NOT NULL
    `origin` VARCHAR(256) NOT NULL DEFAULT 'UY'
);
