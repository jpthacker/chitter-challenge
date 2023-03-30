DROP TABLE IF EXISTS users; 

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email text,
    password text,
    name text,
    handle text
);

TRUNCATE TABLE users, messages RESTART IDENTITY;

INSERT INTO users ("email", "password", "name", "handle") VALUES
('jack@makers.com', 'swordfish', 'Jack Thacker', 'thackattacc'),
('ray@makers.com', 'password123', 'Ray Anderson', 'blackwillow');