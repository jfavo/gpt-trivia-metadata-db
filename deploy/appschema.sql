-- Deploy metadata-db:appschema to pg

BEGIN;

CREATE TABLE "follows" (
  "following_user_id" integer,
  "followed_user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "email" varchar,
  "birth_date" timestamp,
  "role" varchar,
  "created_at" timestamp
);

CREATE TABLE "friend_requests" (
  "id" integer PRIMARY KEY,
  "friend_user_requester" integer,
  "friend_user_requested" integer,
  "accepted" bool,
  "rejected" bool,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "friends" (
  "user_id_1" integer,
  "user_id_2" integer
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "body" text,
  "user_id" integer,
  "status" varchar,
  "created_at" timestamp,
  "edited_at" timestamp
);

CREATE TABLE "player_pool" (
  "id" integer PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "match" (
  "id" integer PRIMARY KEY,
  "player_pool_id" integer,
  "started_at" timestamp,
  "finished_at" timestamp
);

CREATE TABLE "match_questions" (
  "match_id" integer,
  "question" text,
  "answer" text
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("followed_user_id") REFERENCES "users" ("id");

ALTER TABLE "player_pool" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("player_pool_id") REFERENCES "player_pool" ("id");

ALTER TABLE "match_questions" ADD FOREIGN KEY ("match_id") REFERENCES "match" ("id");

ALTER TABLE "friend_requests" ADD FOREIGN KEY ("friend_user_requester") REFERENCES "users" ("id");

ALTER TABLE "friend_requests" ADD FOREIGN KEY ("friend_user_requested") REFERENCES "users" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("user_id_1") REFERENCES "users" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("user_id_2") REFERENCES "users" ("id");

COMMIT;
