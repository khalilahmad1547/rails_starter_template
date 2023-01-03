# Rails Starter Project
- [Rails Starter Project](#rails-starter-project)
  - [Intro](#intro)
  - [Routes](#routes)
  - [Commands](#commands)

## Intro
This is a Rails 7 API only app with pre-configured database, ENV setup, authorization and authorization. It can be used for getting up and running with these features.

## Routes
* **POST** /signup
  
  Sign up link

  **Parameters**

  ```
  {
    "user": {
      "first_name": "",
      "last_name": "",
      "email":"",
      "password": ""
    }
  }
  ```
  All parameters are required.

* **POST** /login
  
  Login link

  **Parameters**

  Body
  ```
  {
    "user": {
      "email":"",
      "password": ""
    }
  }
  ```
  All parameters are required.

* **DELETE** /logout
  
  Sign Out link

  **Parameters**

  Body is not required.

  JWT token is required in Headers

## Commands
Use the supplied generator to generate pundit policies:

```rails g pundit:policy post```