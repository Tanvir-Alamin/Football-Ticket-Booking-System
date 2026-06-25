CREATE TABLE "Users"(
    "user_id" SERIAL NOT NULL,
    "full_name" VARCHAR(255) NOT NULL DEFAULT '100',
    "email" VARCHAR(255) NOT NULL,
    "role" VARCHAR(255) NOT NULL DEFAULT '50',
    "phone_number" VARCHAR(255) NOT NULL DEFAULT '15'
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("user_id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_email_unique" UNIQUE("email");
CREATE TABLE "Matches"(
    "match_id" SERIAL NOT NULL,
    "fixture" VARCHAR(255) NOT NULL,
    "tournament_category" VARCHAR(255) NOT NULL,
    "base_ticket_price" DECIMAL(8, 2) NOT NULL DEFAULT '10,2',
    "match_status" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Matches" ADD PRIMARY KEY("match_id");
CREATE TABLE "Bookings"(
    "booking_id" SERIAL NOT NULL,
    "user_id" BIGINT NOT NULL,
    "match_id" BIGINT NOT NULL,
    "seat_number" VARCHAR(255) NOT NULL,
    "payment_status" VARCHAR(255) NOT NULL,
    "total_cost" DECIMAL(8, 2) NOT NULL DEFAULT '10,2'
);
ALTER TABLE
    "Bookings" ADD PRIMARY KEY("booking_id");
ALTER TABLE
    "Bookings" ADD CONSTRAINT "bookings_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "Matches"("match_id");
ALTER TABLE
    "Bookings" ADD CONSTRAINT "bookings_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");