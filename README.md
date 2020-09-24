# README

# Tithe.ly Technical Demo - Rails/Frontend Developer

In order to set this up to run locally:

1. Make sure you have Ruby '2.5.8' installed locally

2. Make sure you have Rails '5.2.4.4' installed locally

3. Make sure you have [pgAdmin 4 and Postgres](https://www.postgresql.org/) installed locally

4. Clone repo locally

5. Start pgAdmin or Postgres server

6. Replace credentials in 'config/database.yml' with whatever you have pgAdmin set up on

```ruby
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: localhost
  username: postgres
  password: ********
```

7. Open the repo in a code editor like vscode

8. In the terminal run ``` bundle install ```

9. Run ``` rails db:create ```

10. Run ``` rails db:migrate ```

11. Run ``` rails db:seed ```

You should be all set up now, so start your server.

12. Run ``` rails server -p 3000 ``` or ``` rails server ```

13. Navigate to [localhost:3000](http://localhost:3000) in your browser

Then you should see the app!

If you don't, shoot me an email!

Also, by default, the db seeding will not include images and the record will instead display a default static pic. Once the app is running, you can upload photos from your local machine to both update existing records and when creating new records.