SELECT * FROM Book 
SELECT * FROM Book_Language

UPDATE Book 
SET title = 'Harry Potter and the Philosopher s Stone'
WHERE isbn = 2

UPDATE Book_Language
SET name = 'Russian'
WHERE lan_id = 3 


DELETE FROM Book WHERE isbn = 3224 AND price = 20
DELETE FROM Book_Language WHERE name in ('Spanish', 'Dutch');
DELETE FROM Genre WHERE name in ('Poetry') 








