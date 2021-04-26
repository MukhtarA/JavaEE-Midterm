CREATE TABLE `clients` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `surname` VARCHAR(255) NULL,
    `birthday` DATE NULL,
    `adress` VARCHAR(255) NULL,
    `orderstatus` VARCHAR(255) NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
    `flowerType` VARCHAR(255) NULL,
    `color` VARCHAR(255) NULL,
    `price` VARCHAR(255) NULL,
    `season` VARCHAR(255) NULL,
    PRIMARY KEY (`id`)
);
