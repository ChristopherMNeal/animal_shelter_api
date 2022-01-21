# _Animal Shelter API_

#### _Ruby week 6 Code Review project for Rails API lesson at Epicodus Bootcamp_

#### Created By: **Christopher Neal**

## Technologies Used

* _Ruby_
* _Gems_
* _Bundler_
* _RSpec_
* _shoulda-matchers_
* _IRB_
* _Pry_
* _Postgres_
* _SQL_
* _SQL Designer_
* _Rails_
* _Faker_
* _Will Paginate_
* _Factory Bot_

## Description

_This project was created for Epicodus bootcamp to show proficiency in Rails APIs. The application is an API for users to retrieve listings of pets in an animal shelter._
_All users can access animal shelter pet listings and post, update, delete listings._

## System Requirements

* Ruby v2.6.5 recommended
* Postgres 12.9  
* Postman
_(Note: Ruby gem dependencies will be installed automatically by Bundler.)_

## Setup/Installation Requirements

* Clone the GitHub repository: [https://github.com/ChristopherMNeal/animal_shelter_api](https://github.com/ChristopherMNeal/animal_shelter_api)
* From the main project directory, enter `bundle install` in the terminal to populate gems.
* To create a database, type in your terminal: 
      `rake db:setup`
* Enter `rspec` into the terminal to confirm passing of all tests.
* Run `rails s` to start the Rails server.

## Endpoints

|Usage | METHOD       | URL       | Params |
| :--------|:------------| :---------| :------|
|See Pet Listings | GET    | `localhost:3000/pets` | |
|See Pet Listings (Option to Paginate Listings) | GET    | `localhost:3000/pets?page=1` | *page* |
|See A Specific Animal Listing | GET    | `localhost:3000/pets/:id` | |
|Search By Animal Name | GET    | `localhost:3000/pets?name=&page=1` | *name, page* |
|Search By Animal Species | GET    | `localhost:3000/pets?species=&page=1` | *species, page* |
|See A Random Pet | GET    | `localhost:3000/pets/random` | |
|Create a Pet Listing | POST    | `localhost:3000/pets` | *name, content* |
|Update a Pet Listing | PUT    | `localhost:3000/pets/:id` | *name, content* |
|Delete a Pet Listing | DELETE    |`localhost:3000/pets/:id`| |  

## Responses

When getting a single pet listing, expect the response to look like:

```
{
  "id" : integer,
  "name" : string,
  "species" : string
}
```
## Database Schema

![image_of_database_schema](./public/animal_shelter_api_db_schema.png)

## Known Bugs

* _None at this time._

## License

_[MIT](https://opensource.org/licenses/MIT)_
Copyright (c) _2022_ _Christopher Neal_

## Support and Contact Details
* _[christopher.m.neal@gmail.com](mailto:christopher.m.neal@gmail.com)_