CREATE TABLE IF NOT EXISTS account(
    user_id serial PRIMARY KEY,
    username VARCHAR (50) NOT NULL,
    password VARCHAR (30) NOT NULL,
    email VARCHAR (50) NOT NULL
);