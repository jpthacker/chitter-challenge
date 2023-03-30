# Chitter Database Design Recipe Template

## 1. User stories and specification

```
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

So that I can see what others are saying  
I want to see all peeps in reverse chronological order

So that I can better appreciate the context of a peep
I want to see the time at which it was made

So that I can post messages on Chitter as me
I want to sign up for Chitter

So that only I can post messages on Chitter as me
I want to log in to Chitter

So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
```

```
Nouns:

message (peep), time, content, user, email, password, name, username
```

## 2. Table Names and Columns

| Record                | Properties          |
| --------------------- | ------------------  |
| message               | id, content, user_id
| user                  | id, email, password, name, handle

1. Name of the first table (always plural): `messages` 

    Column names: `id`, `content`, `user_id`

2. Name of the second table (always plural): `users` 

    Column names: `id`, `email`, `password`, `name`, `handle`

## 3. The column types.

```
# EXAMPLE:

Table: messages
id: SERIAL
content: text
user_id: int

Table: users
id: SERIAL
email: text
password: email
name: text
handle: text
```

## 4. The Tables Relationship

```
1. Can one message have many users? (No)
2. Can one user have many messages? (Yes)

-> Therefore,
-> A user HAS MANY messages
-> A message BELONGS TO a user

-> Therefore, the foreign key is on the messages table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
-- file: users_seeds.sql

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

INSERT INTO artists ("name", "genre") VALUES
('Pixies', 'Rock'),
('Nina Simone', 'Pop');

INSERT INTO messages ("content", "user_id") VALUES
('My first peep', 1),
( 'Ed balls', 2);

-- file: messages_seeds.sql

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
( 'Ed balls', 2);_

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < users_seeds.sql;
psql -h 127.0.0.1 chitter < messages_seeds.sql;
```