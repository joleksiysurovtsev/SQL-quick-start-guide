SELECT *
FROM products
LIMIT 10;
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE test1
(
    a character(4)
);
INSERT INTO test1
VALUES ('ok');
SELECT a, char_length(a)
FROM test1;
-- (1)
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE test2
(
    b varchar(5)
);
INSERT INTO test2
VALUES ('ok');
INSERT INTO test2
VALUES ('good      ');
INSERT INTO test2
VALUES ('too long');
------------------------------------------------------------------------------------------------------------------------
INSERT INTO test2
VALUES ('too long'::varchar(5)); -- явное усечение
SELECT b, char_length(b)
FROM test2;
------------------------------------------------------------------------------------------------------------------------