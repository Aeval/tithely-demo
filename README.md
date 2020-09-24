# README

# Tithe.ly Technical Demo - Rails/Frontend Developer

In order to set this up to run locally:

1. Make sure you have Ruby '2.5.8' installed locally

2. Make sure you have Rails '5.2.4.4' installed locally

3. Make sure you have [pgAdmin 4 and Postgres](https://www.postgresql.org/) installed locally

4. Clone repo locally

5. Start pgAdmin or Postgres server

6. Replace credentials in 'config/database.yml'

```ruby
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: **localhost**
  username: **postgres**
  password: ********
```
