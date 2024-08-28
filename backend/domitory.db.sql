CREATE TABLE IF NOT EXISTS `admins` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`firstname` VARCHAR(255),
	`lastname` VARCHAR(255),
	`birth_day` DATETIME,
	`password` VARCHAR(255),
	`phon_number` VARCHAR(255),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `announcements` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`title` VARCHAR(255),
	`date` DATETIME,
	`admin_id` INT,
	CONSTRAINT `fk_admins_announcement` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `current_addresses` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`house_no` VARCHAR(255),
	`village_no` VARCHAR(255),
	`alley` VARCHAR(255),
	`road` VARCHAR(255),
	`sub_district` VARCHAR(255),
	`district` VARCHAR(255),
	`phon_number` VARCHAR(255),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dorms` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`type` VARCHAR(255),
	`dorm_gender` VARCHAR(255),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `rooms` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`r_id` VARCHAR(255),
	`room_number` INT,
	`available` VARCHAR(255),
	`confirmation` VARCHAR(255),
	`dorm_id` INT,
	CONSTRAINT `fk_dorms_rooms` FOREIGN KEY (`dorm_id`) REFERENCES `dorms` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `students` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`s_id` VARCHAR(255),
	`password` VARCHAR(255),
	`first_name` VARCHAR(255),
	`last_name` VARCHAR(255),
	`year` INT,
	`birthday` DATETIME,
	`gender` VARCHAR(255),
	`major` VARCHAR(255),
	`room_id` INT,
	CONSTRAINT `fk_rooms_students` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `delayed_payment_forms` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`name` VARCHAR(255),
	`dorm_payment` FLOAT,
	`electricly_bill` FLOAT,
	`water_bill` FLOAT,
	`because_of` VARCHAR(255),
	`due_date` DATETIME,
	`status` VARCHAR(255),
	`student_id` INT,
	`admin_id` INT,
	CONSTRAINT `fk_admins_delayed_payment_forms` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
	CONSTRAINT `fk_students_delayed_payment_forms` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `electricity_fees` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`amount` FLOAT,
	`room_id` INT,
	CONSTRAINT `fk_rooms_electricity_fees` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `expenses` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`date` DATETIME,
	`remark` VARCHAR(255),
	`rent_fee_id` INT,
	`elec_fee_id` INT,
	`water_id` INT,
	`slip_id` INT,
	CONSTRAINT `fk_water_fees_expenses` FOREIGN KEY (`water_id`) REFERENCES `water_fees` (`id`),
	CONSTRAINT `fk_slips_expenses` FOREIGN KEY (`slip_id`) REFERENCES `slips` (`id`),
	CONSTRAINT `fk_rent_fees_expenses` FOREIGN KEY (`rent_fee_id`) REFERENCES `rent_fees` (`id`),
	CONSTRAINT `fk_electricity_fees_expenses` FOREIGN KEY (`elec_fee_id`) REFERENCES `electricity_fees` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `repairings` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`subject` VARCHAR(255),
	`detail` TEXT,
	`image` BLOB,
	`location_details` VARCHAR(255),
	`contact` VARCHAR(255),
	`time_slot` VARCHAR(255),
	`remarks` VARCHAR(255),
	`status` VARCHAR(255),
	`student_id` INT,
	`admin_id` INT,
	PRIMARY KEY (`id`),
	CONSTRAINT `fk_students_repairings` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
	CONSTRAINT `fk_admins_repairings` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
);

CREATE TABLE IF NOT EXISTS `resigning_forms` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`name` VARCHAR(255),
	`date` DATETIME,
	`because_of` TEXT,
	`accommodation` TEXT,
	`phone_number` VARCHAR(255),
	`status` VARCHAR(255),
	`student_id` INT,
	`admin_id` INT,
	`current_address_id` INT,
	PRIMARY KEY (`id`),
	CONSTRAINT `fk_resigning_forms_current_address` FOREIGN KEY (`current_address_id`) REFERENCES `current_addresses` (`id`),
	CONSTRAINT `fk_admins_resigning_forms` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
	CONSTRAINT `fk_students_resigning_forms` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
);

CREATE TABLE IF NOT EXISTS `slips` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`path` VARCHAR(255),
	`date` DATETIME,
	`status` VARCHAR(255),
	`student_id` INT,
	`admin_id` INT,
	CONSTRAINT `fk_admins_slips` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
	CONSTRAINT `fk_students_slips` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `rent_fees` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`amount` FLOAT,
	`room_id` INT,
	CONSTRAINT `fk_rooms_rent_fees` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `water_fees` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`amount` FLOAT,
	`room_id` INT,
	CONSTRAINT `fk_rooms_water_fees` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `en_exiting_forms` (
	`id` INT AUTO_INCREMENT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	`deleted_at` DATETIME,
	`start_date` DATETIME,
	`end_date` DATETIME,
	`return_time` DATETIME,
	`return_date` DATETIME,
	`request_date` DATETIME,
	`reason` VARCHAR(255),
	`image` BLOB,
	`phone_number` VARCHAR(255),
	`status` VARCHAR(255),
	`student_id` INT,
	`admin_id` INT,
	CONSTRAINT `fk_admins_en_exiting_forms` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
	CONSTRAINT `fk_students_en_exiting_forms` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
	PRIMARY KEY (`id`)
);
