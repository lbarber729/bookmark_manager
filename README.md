# User Stories

### User story 1
```
In order to see the bookmarks I have saved
I would like the page to show a list of bookmarks
```

Object | Message
-|-
Bookmark | Show a list

Page ------------ Bookmark
---------show-------->
<--list of bookmarks---
(use draw.io)

### User story 2
```
To keep my bookmarks up to date
I would like to be able to add to my list of bookmarks
```

Object | Message
-|-
Bookmark | Add 

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To set up the test database

Connect to `psql` and create the `bookmark_manager_test` database:

```
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.
