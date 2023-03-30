DROP TABLE IF EXISTS messages; 

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content text,
  timestamp timestamp,
  user_id int4,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE messages RESTART IDENTITY;

INSERT INTO messages ("content", "timestamp", "user_id") VALUES
('My first peep', '2023-03-29 10:35:20+00', 1),
( 'Ed balls', CURRENT_TIMESTAMP, 2);