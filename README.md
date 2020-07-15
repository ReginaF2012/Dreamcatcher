# DreamCatcher Overview

DreamCatcher is a dream diary website. Once signed up users can post their dream diaries, either publicly or privately. After posting a dream log a user can choose to add symbols to their dream and define the meaning. They can view user's other publicly posted dream logs and there is an index of symbols, with the name and all of the associated meanings added by users in the dreams they've posted publicly. 

## Installation

Fork and clone this repo then create a database

    $ rail db:create

Seed the database

    $ rake db:seed

Startup the server

    $ rails s

View on browser

    $  localhost:3000

## Usage

Users can view all publicly posted dreams and the associated dream symbolism meanings, but sign in is required to create any posts.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).