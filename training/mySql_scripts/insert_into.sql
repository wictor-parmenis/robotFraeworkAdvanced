INSERT INTO account (user_id, username, password, email)
VALUES (round(CAST (random()*100 AS NUMERIC),0), 'Joao Gomes', '123456', 'joaotec@gmail.com')