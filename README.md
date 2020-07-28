User Stories

```
As a user
I would like to see a list of sites that I have bookmarked
So that I can find my favourite websites quickly

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

As a user
So I can choose which websites are in my bookmarks
I would like to be able to add the url to my bookmark manager
```

Database Setup

- Brew install potgresql
- Brew services start postgresql
- CREATE DATABASE bookmark_manager;
- \c bookmark_manager;
- run 01_create_bookmarks_table.sql

Test Database Setup
- CREATE DATABASE bookmark_manager_test;
- \c bookmark_manager_test;
- run 01_create_bookmarks_table.sql
