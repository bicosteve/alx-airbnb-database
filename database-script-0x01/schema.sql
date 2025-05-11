CREATE TABLE `User` (
    `user_id` UUID NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(255),
    `role` ENUM('guest', 'host', 'admin') NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`)
);

CREATE INDEX idx_user_id ON `User`(`user_id`, `email`);

CREATE TABLE `Property` (
    `property_id` UUID NOT NULL,
    `host_id` UUID,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `pricepernight` DECIMAL(10, 2),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`property_id`),
    FOREIGN KEY `host_id` REFERENCES User(`user_id`)
);

CREATE INDEX idx_property_id ON `Property`(`property_id`, `created_at`);

CREATE TABLE `Booking` (
    `booking_id` UUID NOT NULL,
    `property_id` UUID NOT NULL,
    `user_id` UUID NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_price` DECIMAL(10, 2) NOT NULL,
    `status` ENUM('pending', 'confirmed', 'canceled'),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`booking_id`),
    FOREIGN KEY `property_id` REFERENCES Property(`property_id`),
    FOREIGN KEY `user_id` REFERENCES User(`user_id`)
);

CREATE INDEX idx_booking_id ON `Booking`(`booking_id`, `created_at`);

CREATE TABLE `Payment` (
    `payment_id` UUID NOT NULL,
    `booking_id` UUID NOT NULL,
    `amount` DECIMAL(10, 2),
    `payment_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `payment_method` ENUM('credit_card', 'paypal', 'stripe'),
    PRIMARY KEY (`payment_id`),
    FOREIGN KEY `booking_id` REFERENCES Booking(`booking_id`)
);

CREATE INDEX idx_payment_id ON `Payment`(`payment_id`, `payment_date`);

CREATE TABLE `Review` (
    `review_id` UUID NOT NULL,
    `property_id` UUID NOT NULL,
    `user_id` UUID NOT NULL,
    `rating` INT CHECK (
        rating >= 1
        AND <= 5
    ) NOT NULL,
    `comment` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`review_id`),
    FOREIGN KEY `property_id` REFERENCES Property(`property_id`),
    FOREIGN KEY `user_id` REFERENCES User(`user_id`)
);

CREATE INDEX idx_review_id ON `Review`(`review_id`, `rating`);

CREATE TABLE `Message` (
    `message_id` UUID NOT NULL,
    `sender_id` UUID NOT NULL,
    `recipient_id` UUID NOT NULL,
    `message_body` TEXT NOT NULL,
    `sent_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`message_id`),
    FOREIGN KEY `sender_id` REFERENCES User(`sender_id`),
    FOREIGN KEY `recipient_id` REFERENCES User(`sender_id`),
);

CREATE INDEX idx_message_id ON `Message`(`message_id`, `sent_at`);