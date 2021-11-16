# Backend code challenge

For the creation of this project I used Ruby on Rails, an open-source framework used to build Rest API. The web server was built using XAMPP, MySQL and phpMyAdmin.

The project is able to register vehicles, collect their locations in real time and delete the vehicles when it will stop emitting location updates.

## Installation

```console
# XAMPP, phpMyAdmin and Ruby on Rails are required to run this project.

# https://www.apachefriends.org/download.html
# https://www.phpmyadmin.net/downloads/
# https://www.ruby-lang.org/en/downloads/


# open command line and cd to the project directory
$ cd vehicles


# install rails
$ gem install rails


# install the requirements
$ install bundler
$ bundle install


# once the bundle is installed and XAMPP has started running Apache and MySQL we can start our rails project
$ rails db:migrate:up VERSION=20211113203640    # Numbers that appear in vehicles/db/migrate create_vehicles.rb file
$ rails db:migrate:up VERSION=20211115144255    # Numbers that appear in vehicles/db/migrate create_vehicles.rb file
$ rails s
```



## Postman

We can test our get, post and delete requests using Postman.

GET :

```
# Request URL
http://localhost:3000/vehicles/
```

POST : Two posts are needed. The first one will register the vehicle, the second one will update its location data.

First Post
```
# Request URL
http://localhost:3000/vehicles/

# Headers | Content-type - application/json

# Body
{
    "id":"852e593c-057b-417e-a2cf-4315b3cfb31"
}
```

Second Post
```
# Request URL
http://localhost:3000/vehicles/852e593c-057b-417e-a2cf-4315b3cfb31/locations

# Headers | Content-type - application/json

# Body
{
    "id":"852e593c-057b-417e-a2cf-4315b3cfb31",
    "lat":85.5,
    "lng":82.1,
    "at":"2021-11-14T01:09:33.258Z"
}
```

DELETE :

```
# Request URL
http://localhost:3000/vehicles/852e593c-057b-417e-a2cf-4315b3cfb31
```



## Handling more than 1000 vehicles

For demonstrating how the solution would handle 1000+ vehicles, I used Faker. A library for generating fake data. We can see here that it created 1000+ rows of data.

![image](https://user-images.githubusercontent.com/72938289/141835011-8f8eb24e-9889-473a-9031-9c55240b55c8.png)
