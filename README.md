In order to see the bookmarks I have saved
I would like the page to show a list of bookmarks

Object | Message
Bookmark | Show a list

Page ------------ Bookmark
---------show-------->
<--list of bookmarks---
(use draw.io)

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.
