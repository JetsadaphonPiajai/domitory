BEGIN TRANSACTION;
DROP TABLE IF EXISTS "admins";
CREATE TABLE IF NOT EXISTS "admins" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"firstname"	text,
	"lastname"	text,
	"birth_day"	datetime,
	"password"	text,
	"phon_number"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "announcements";
CREATE TABLE IF NOT EXISTS "announcements" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"title"	text,
	"date"	datetime,
	"admin_id"	integer,
	CONSTRAINT "fk_admins_announcement" FOREIGN KEY("admin_id") REFERENCES "admins"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "current_addresses";
CREATE TABLE IF NOT EXISTS "current_addresses" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"house_no"	text,
	"village_no"	text,
	"alley"	text,
	"road"	text,
	"sub_district"	text,
	"district"	text,
	"phon_number"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "dorms";
CREATE TABLE IF NOT EXISTS "dorms" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"type"	text,
	"dorm_gender"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "rooms";
CREATE TABLE IF NOT EXISTS "rooms" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"r_id"	text,
	"room_number"	integer,
	"available"	text,
	"confirmation"	text,
	"dorm_id"	integer,
	CONSTRAINT "fk_dorms_rooms" FOREIGN KEY("dorm_id") REFERENCES "dorms"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "students";
CREATE TABLE IF NOT EXISTS "students" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"s_id"	text,
	"password"	text,
	"first_name"	text,
	"last_name"	text,
	"year"	integer,
	"birthday"	datetime,
	"gender"	text,
	"major"	text,
	"room_id"	integer,
	CONSTRAINT "fk_rooms_students" FOREIGN KEY("room_id") REFERENCES "rooms"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "delayed_payment_forms";
CREATE TABLE IF NOT EXISTS "delayed_payment_forms" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"name"	text,
	"dorm_payment"	real,
	"electricly_bill"	real,
	"water_bill"	real,
	"because_of"	text,
	"due_date"	datetime,
	"status"	text,
	"student_id"	integer,
	"admin_id"	integer,
	CONSTRAINT "fk_admins_delayed_payment_forms" FOREIGN KEY("admin_id") REFERENCES "admins"("id"),
	CONSTRAINT "fk_students_delayed_payment_forms" FOREIGN KEY("student_id") REFERENCES "students"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "electricity_fees";
CREATE TABLE IF NOT EXISTS "electricity_fees" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"amount"	real,
	"room_id"	integer,
	CONSTRAINT "fk_rooms_electricity_fees" FOREIGN KEY("room_id") REFERENCES "rooms"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "en_exiting_forms";
CREATE TABLE IF NOT EXISTS "en_exiting_forms" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"name"	text,
	"date_submission"	datetime,
	"because_of"	text,
	"date_reques"	datetime,
	"status"	text,
	"student_id"	integer,
	"admin_id"	integer,
	CONSTRAINT "fk_students_en_exiting_forms" FOREIGN KEY("student_id") REFERENCES "students"("id"),
	CONSTRAINT "fk_admins_en_exiting_forms" FOREIGN KEY("admin_id") REFERENCES "admins"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "slips";
CREATE TABLE IF NOT EXISTS "slips" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"path"	text,
	"date"	datetime,
	"status"	text,
	"student_id"	integer,
	"admin_id"	integer,
	CONSTRAINT "fk_admins_slips" FOREIGN KEY("admin_id") REFERENCES "admins"("id"),
	CONSTRAINT "fk_students_slips" FOREIGN KEY("student_id") REFERENCES "students"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "rent_fees";
CREATE TABLE IF NOT EXISTS "rent_fees" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"amount"	real,
	"dorm_id"	integer,
	CONSTRAINT "fk_dorms_rent_fees" FOREIGN KEY("dorm_id") REFERENCES "dorms"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "water_fees";
CREATE TABLE IF NOT EXISTS "water_fees" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"amount"	real,
	"dorm_id"	integer,
	CONSTRAINT "fk_dorms_water_fees" FOREIGN KEY("dorm_id") REFERENCES "dorms"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "expenses";
CREATE TABLE IF NOT EXISTS "expenses" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"date"	datetime,
	"remark"	text,
	"rent_fee_id"	integer,
	"elec_fee_id"	integer,
	"water_id"	integer,
	"slip_id"	integer,
	CONSTRAINT "fk_water_fees_expenses" FOREIGN KEY("water_id") REFERENCES "water_fees"("id"),
	CONSTRAINT "fk_slips_expenses" FOREIGN KEY("slip_id") REFERENCES "slips"("id"),
	CONSTRAINT "fk_rent_fees_expenses" FOREIGN KEY("rent_fee_id") REFERENCES "rent_fees"("id"),
	CONSTRAINT "fk_electricity_fees_expenses" FOREIGN KEY("elec_fee_id") REFERENCES "electricity_fees"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "repairings";
CREATE TABLE IF NOT EXISTS "repairings" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"subject"	text,
	"detail"	text,
	"image"	blob,
	"location_details"	text,
	"contact"	text,
	"time_slot"	text,
	"remarks"	text,
	"status"	text,
	"student_id"	integer,
	"admin_id"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	CONSTRAINT "fk_students_repairings" FOREIGN KEY("student_id") REFERENCES "students"("id"),
	CONSTRAINT "fk_admins_repairings" FOREIGN KEY("admin_id") REFERENCES "admins"("id")
);
DROP TABLE IF EXISTS "resigning_forms";
CREATE TABLE IF NOT EXISTS "resigning_forms" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"name"	text,
	"date"	datetime,
	"because_of"	text,
	"accommodation"	text,
	"phone_number"	text,
	"status"	text,
	"student_id"	integer,
	"admin_id"	integer,
	"current_address_id"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	CONSTRAINT "fk_resigning_forms_current_address" FOREIGN KEY("current_address_id") REFERENCES "current_addresses"("id"),
	CONSTRAINT "fk_admins_resigning_forms" FOREIGN KEY("admin_id") REFERENCES "admins"("id"),
	CONSTRAINT "fk_students_resigning_forms" FOREIGN KEY("student_id") REFERENCES "students"("id")
);
DROP INDEX IF EXISTS "idx_admins_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_admins_deleted_at" ON "admins" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_announcements_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_announcements_deleted_at" ON "announcements" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_current_addresses_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_current_addresses_deleted_at" ON "current_addresses" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_dorms_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_dorms_deleted_at" ON "dorms" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_rooms_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_rooms_deleted_at" ON "rooms" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_students_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_students_deleted_at" ON "students" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_delayed_payment_forms_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_delayed_payment_forms_deleted_at" ON "delayed_payment_forms" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_electricity_fees_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_electricity_fees_deleted_at" ON "electricity_fees" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_en_exiting_forms_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_en_exiting_forms_deleted_at" ON "en_exiting_forms" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_slips_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_slips_deleted_at" ON "slips" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_rent_fees_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_rent_fees_deleted_at" ON "rent_fees" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_water_fees_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_water_fees_deleted_at" ON "water_fees" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_expenses_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_expenses_deleted_at" ON "expenses" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_repairings_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_repairings_deleted_at" ON "repairings" (
	"deleted_at"
);
DROP INDEX IF EXISTS "idx_resigning_forms_deleted_at";
CREATE INDEX IF NOT EXISTS "idx_resigning_forms_deleted_at" ON "resigning_forms" (
	"deleted_at"
);
COMMIT;
