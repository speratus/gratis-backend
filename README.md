# README
Gratis is a short message service designed to help people express gratitude to their friends and those
they follow.

This is only the backend. It needs to run in tandem with the frontend, [found here](https://github.com/spereatus/gratis-frontend).

## Requirements
Gratis depends on the following libraries:

* Ruby `2.6.1`
* Ruby on Rails (`6.0.2`)
* Postgresql

Make sure you have all of them installed before progressing any futher.

## Installation
Once you have all the required libraries, navigate to the directory where you would want it to live and clone the repo:
```
git clone https://github.com/speratus/gratis-backend
```

`cd` into the directory and run
```
bundle install
```
to download all the dependencies required to run. 

Once ruby has installed all the necessary gems, you can
set up the database by running the following commands:
```
~ rake db:create
~ rake db:migrate
```
This will setup the database so that the server can run. 

### Seed the database (Optional)
If you want to have the some data in the database by default, you will need to run an extra command.
Seeding requires the `Faker` gem, so make sure that you have it installed before continuing.
Once Faker is installed, run 
```
rake db:seed
```
This will generate some starting data to populate the database.

## Running the server
Once you are satisfied with your installation, you can start up the server by navigating to the 
directory where the repo lives and running
```
rails s
```

You can now start up the frontend server so that you can login.

## Dependencies

* [Ruby on Rails](https://rubyonrails.org)
* [JWT](https://github.com/jwt/ruby-jwt)
* [BCrypt](https://github.com/codahale/bcrypt-ruby)
* [Rails Action Authorization](https://github.com/speratus/authorizer)
* [Dotenv-Rails](https://github.com/bkeepers/dotenv)
* [Rack-Cors](https://github.com/cyu/rack-cors)
* [Faker](https://github.com/faker-ruby/faker) (For seeding the database).
