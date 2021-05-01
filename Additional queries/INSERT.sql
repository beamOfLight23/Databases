
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (1, 'Margaret', 'Mitchell'); 
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (2, 'J.K.', 'Rowling');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (3, 'J.D.', 'Salinger');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (4, 'Gabriel', 'Marquez');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (5, 'George', 'Orwell');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (6, 'Harper', 'Lee');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (7, 'Jane', 'Austen');
INSERT INTO Author("author_id", "first_name", "last_name") VALUES (8, 'Fyodor', 'Dostoyevsky');


SELECT * FROM Author;

INSERT INTO Publisher VALUES (80, 'Humanitas','Piata Presei Libere nr. 1, Bucuresti'); 
INSERT INTO Publisher VALUES (81, 'Penguin Books', '20 Vauxhall Bridge Rd, London'); 
SELECT * FROM Publisher;

 
INSERT INTO Genre("gen_id", "name") VALUES (101, 'Romance'); 
INSERT INTO Genre("gen_id", "name") VALUES (102, 'Historical fiction'); 
INSERT INTO Genre("gen_id", "name") VALUES (103, 'Adventure'); 
INSERT INTO Genre("gen_id", "name") VALUES (104, 'Poetry'); 
INSERT INTO Genre("gen_id", "name") VALUES (105, 'Diary'); 
INSERT INTO Genre("gen_id", "name") VALUES (106, 'Crime fiction'); 
INSERT INTO Genre("gen_id", "name") VALUES (107, 'Short story'); 
SELECT * FROM Genre; 

INSERT INTO Book("isbn", "title", "author_id", "price", "book_language", "pub_id", "gen_id") VALUES (1000, 'Gone with the Wind', 1, 20, 'English', 81, 101); 
INSERT INTO Book VALUES (1001, 'Harry Potter', 2, 40, 'Romanian', 80, 103);
INSERT INTO Book VALUES (1002, 'The Catcher in the Rye', 3, 50, 'English', 81, 103);
INSERT INTO Book VALUES (1004, 'One hundred years of solitude' , 4, 35, 'English', 81, 101);
INSERT INTO Book VALUES (1005, 'Animal Farm', 5, 35, 'English', 81, 102);
INSERT INTO Book VALUES (1006, 'To kill a Mockingbird', 6, 39, 'English',81, 102);
INSERT INTO Book VALUES (1007, 'Emma', 7, 13, 'Romanian', 80, 101);
INSERT INTO Book VALUES (1008, 'Notes from Underground', 8, 22, 'Russian', 81, 106);
INSERT INTO Book VALUES (1009, 'Crime and Punishment', 8, 28, 'English', 81, 106);
INSERT INTO Book VALUES (1010, '1984', 5, 50, 'Romanian', 80, 102); 
SELECT * FROM Book;


INSERT INTO Customer VALUES (555, 'Michael', 'Black', '10 Main St', '444-332'); 
INSERT INTO Customer VALUES (556, 'Erik', 'Doe', '56 Goldbrooke', '434-232'); 
INSERT INTO Customer VALUES (557, 'Aly', 'Morgan', '24 Main St', '443-322'); 
INSERT INTO Customer VALUES (558, 'Ozzy', 'Browne', '89 Branch St', '444-100'); 
