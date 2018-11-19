As a user,
I want to see a list of bookmarks
So that I am able to know what I need to look at today


![Screenshot](diagram.png)

### To set up the database
Connect to `psql` and create the `bookmark_manager` database:
```
CREATE DATABASE bookmark_manager;
```
To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.
