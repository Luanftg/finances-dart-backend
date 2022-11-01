CREATE SCHEMA IF NOT EXISTS `finances` DEFAULT CHARACTER SET utf8;
USE `finances`;

CREATE TABLE IF NOT EXISTS `finances`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `is_auth` TINYINT NULL DEFAULT 1,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `image` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `finances`.`accounts` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `balance` FLOAT,
    `id_user` INT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `id_user`
        FOREIGN KEY (`id_user`)
        REFERENCES `finances`.`users` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB;