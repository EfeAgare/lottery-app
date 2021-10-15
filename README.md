# README
###  Ruby version
  - 3.0.0

### System dependencies
  - postgres
  - redis
  - rails

###  Configuration
   Edit the username and password for postgresDB
   - cp -v config/application-examle.yml config/application.yml
  
   - run => bundle

###  Database creation:
   - rails db:create

###  Database initialization:
   - rails db:migrate

### How to run the test suite:
  - rspec

### Services: This app uses sidekiq, redis to run background jobs
   the command to starts are
  - redis-server
  - sidekiq


### How to run the app-server:
   Ensure you have ruby installed and have completed the steps above. Then run
   - rails s


### LIMITATIONS
  - Only one random ticket number is being generated
  - You can only make one bid per bid window
  - Improve on a better way to inform the user that draw has started
  - Send email notifications to user
