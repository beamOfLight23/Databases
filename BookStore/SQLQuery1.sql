/*SELECT * FROM Book
SELECT * FROM Author
SELECT * FROM Book_Language
SELECT * FROM Genre
SELECT * FROM Publisher*/

/*SET IDENTITY_INSERT Author ON; 
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (1, 'Margaret', 'Mitchell'); 
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (2, 'J.K.', 'Rowling');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (3, 'J.D.', 'Salinger');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (4, 'Gabriel', 'Marquez');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (5, 'George', 'Orwell');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (6, 'Harper', 'Lee');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (7, 'Jane', 'Austen');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (8, 'Fyodor', 'Dostoyevsky');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (9, 'Fyodor', 'Dostoyevsky');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (10, 'George', 'Orwell');*/


SET IDENTITY_INSERT Book ON; 

INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1001, 'Gone with the Wind', 1, 20); 
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1002, 'Harry Potter', 2, 40);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1003, 'The Catcher in the Rye', 3, 50);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1004, 'One hundred years of solitude' , 4, 35);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1005, 'Animal Farm', 5, 35);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1006, 'To kill a Mockingbird', 6, 39);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1007, 'Emma', 7, 13);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1008, 'Notes from Underground', 8, 22);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1009, 'Crime and Punishment', 9, 28);
INSERT INTO Book("isbn", "title", "author_id", "price") VALUES (1010, '1984', 10, 50); 

SET IDENTITY_INSERT Publisher ON; 

INSERT INTO Publisher("pub_id", "name") VALUES (70, 'Humanitas'); 
INSERT INTO Publisher("pub_id", "name") VALUES (71, 'Penguin Books'); 

SET IDENTITY_INSERT Book_Language ON; 
INSERT INTO Book_Language("lan_id", "name") VALUES (10, 'English');
INSERT INTO Book_Language("lan_id", "name") VALUES (20, 'French');
INSERT INTO Book_Language("lan_id", "name") VALUES (30, 'German'); 
INSERT INTO Book_Language("lan_id", "name") VALUES (40, 'Romanian'); 
INSERT INTO Book_Language("lan_id", "name") VALUES (50, 'Spanish');
INSERT INTO Book_Language("lan_id", "name") VALUES (60, 'Dutch'); 


SET IDENTITY_INSERT Genre ON; 
INSERT INTO Genre("gen_id", "name") VALUES (101, 'Romance'); 
INSERT INTO Genre("gen_id", "name") VALUES (102, 'Historical fiction'); 
INSERT INTO Genre("gen_id", "name") VALUES (103, 'Adventure'); 
INSERT INTO Genre("gen_id", "name") VALUES (104, 'Poetry'); 
INSERT INTO Genre("gen_id", "name") VALUES (105, 'Biography'); 
INSERT INTO Genre("gen_id", "name") VALUES (106, 'Crime fiction'); 



-- UPDATE 


