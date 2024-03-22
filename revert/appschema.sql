-- Revert metadata-db:appschema from pg

BEGIN;

DROP TABLE "friend_requests";
DROP TABLE "friends";
DROP TABLE "follows";
DROP TABLE "posts";
DROP TABLE "match_questions";
DROP TABLE "match";
DROP TABLE "player_pool";
DROP TABLE "users";

COMMIT;
