-- UPDATE 2 tables 

UPDATE Book
SET book_language = 'Russian' 
WHERE title = 'Crime and Punishment' and author_id = 8; 

UPDATE Genre 
SET name = 'Fiction' 
WHERE name LIKE '%story%'; 

-- DELETE 1 TABLE 

DELETE FROM GENRE WHERE name IN ('Poetry', 'Diary'); 

-- UNION 

SELECT gen_id FROM Book 
UNION 
SELECT gen_id FROM Genre; 

-- INTERSECT 

SELECT author_id FROM Author 
INTERSECT 
SELECT author_id FROM Book; 

-- EXCEPT 
SELECT gen_id from Genre 
EXCEPT 
SELECT gen_id from Book; 

-- INNER JOIN 
SELECT Book.isbn, Genre.gen_id 
FROM Book
INNER JOIN Genre ON Book.gen_id = Genre.gen_id;

-- LEFT JOIN 
SELECT Book.isbn, Genre.gen_id 
FROM Book
LEFT JOIN Genre ON Book.gen_id = Genre.gen_id;

-- RIGHT JOIN 
SELECT Book.isbn, Genre.gen_id 
FROM Book
RIGHT JOIN Genre ON Book.gen_id = Genre.gen_id
ORDER BY Book.isbn;

-- FULL JOIN 
SELECT Book.isbn, Genre.gen_id 
FROM Book
INNER JOIN Genre ON Book.gen_id = Genre.gen_id
ORDER BY Book.isbn;

-- IN - WHERE CLAUSE
SELECT title FROM Book
WHERE gen_id IN (SELECT gen_id FROM Genre); 

-- EXISTS - WHERE CLAUSE 
SELECT DISTINCT name 
FROM Publisher 
WHERE EXISTS (SELECT title FROM Book WHERE Book.pub_id = Publisher.pub_id AND book_language = 'English');

-- GROUP BY 
SELECT COUNT(isbn), book_language 
FROM Book 
GROUP BY book_language
HAVING book_language = 'Russian'; 

SELECT COUNT(isbn), pub_id
FROM Book 
GROUP BY pub_id
HAVING pub_id = 81; 
