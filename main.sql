Book
+-------------+------------+------+-----+---------+----------------+
| Field | Type | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+----------------+
| id | int(11) | NO | PRI | NULL | auto_increment |
| name | VARCHAR(50)| NO | | NULL | |
+-------------+------------+------+-----+---------+----------------+

Author
+-------------+------------+------+-----+---------+----------------+
| Field | Type | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+----------------+
| id | int(11) | NO | PRI | NULL | auto_increment |
| name | VARCHAR(50)| NO | | NULL | |
+-------------+------------+------+-----+---------+----------------+

AuthorBook
+-------------+------------+------+-----+---------+----------------+
| Field | Type | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+----------------+
| book_id | int(11) | NO | | NULL | |
| author_id | int(11) | YES | MUL | NULL | |
+-------------+------------+------+-----+---------+----------------+

/**
1. Найти всех авторов у которых нет книг
2. Посчитать количество книг у каждого автора
3. Выбрать топ 5 авторов с максимальным количество книг
*/

SELECT Author.* FROM Author 
LEFT JOIN AuthorBook ON AuthorBook.author_id = Author.id 
WHERE AuthorBook.author_id IS NULL

SELECT Author.id, COUNT(AuthorBook.author_id) as BooksCount FROM Author 
LEFT JOIN AuthorBook ON (AuthorBook.author_id=Author.id)
GROUP BY Author.id

SELECT Author.id, COUNT(AuthorBook.author_id) as BooksCount FROM Author 
LEFT JOIN AuthorBook ON (AuthorBook.author_id=Author.id)
GROUP BY Author.id
ORDER BY BooksCount DESC
LIMIT 5
