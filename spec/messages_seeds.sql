DROP TABLE IF EXISTS messages; 

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content text,
  user_id int4,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE messages RESTART IDENTITY;

INSERT INTO messages ("content", "user_id") VALUES
('My first peep', 1),
('Ed balls', 2);