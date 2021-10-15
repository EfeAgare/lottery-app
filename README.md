# README

* Ruby version
   - 3.0.0

* System dependencies
    - postgres
    - redis

* Configuration

   - cp -v config/application-examle.yml  config/application.yml
     then edit the username and password for postgresDB
   - run => bundle

* Database creation
   - rails db:create

* Database initialization
   - rails db:migrate

* How to run the test suite
  - rspec

* Services: This app uses sidekiq, redis to run background jobs
   the command to starts are
  - redis-server
  - sidekiq




