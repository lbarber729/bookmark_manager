## Bookmark Manager
The aim of this project it to build a website to maintain a collection of bookmarks using a database.

The website should have the following specification -
- Show a list of bookmarks
- Add new bookmarks  
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their on bookmarks

# Set up

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

# User Stories

### User story 1
```
As a user
In order to see the bookmarks I have saved
I would like the page to show a list of bookmarks
```

Object | Message
-|-
User |
Bookmark | Show a list

![Alt Text](https://i.postimg.cc/QNRY8t0N/User-Story-1-bookmarks.jpg)

### User story 2
```
As a user
To keep my bookmarks up to date
I would like to be able to add to my list of bookmarks
```

Object | Message
-|-
User |
Bookmark | Add
