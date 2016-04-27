# milkninja API

 Welcome to milkninja, a public site for posting awesome places to nurse in comfort and privacy.

## General Rules

### Authorization

 All authorized requests unless otherwise mentioned require
 an "**Auth-Token**" header to be present. Users are assigned an
 Auth Token during account creation.

### Errors

 Any request that fails to be processed will contain an "errors"
 key in the returned JSON describing the problem.

## Routes

#### POST /register

  This creates a new user
  Params:
    * first_name: string
    * last_name: string
    * username: string
    * email: string
    * password: string
    * zipcode: integer
    * avatar: attachment

  Returns 201 Created on Success and 422 Unprocessable Entity in case fof failure.

  **Request:**

  ```
  {
    "first_name": "Mallerie"
    "last_name": "Shirley"
    "username": "username"
    "password": "password"
    "zipcode": "00000"
    "avatar": "daisy_pollen_flower_220533.jpg"

  }
  ```

  **Response:**

  ```
  {
    "user": {
      "first_name": "Mallerie",
      "username": "username",
      "auth_token": "7774743beeb3c26dfdd80213ba1b9097",
      "avatar": "http://s3.amazonaws.com/milkninja/users/avatars/000/000/017/original/daisy_pollen_flower220533.jpg?1461781531"
    }
  }
  ```

#### POST /login

This logs in your user
   Params:
   	* username: string
   	* password: string

   	* header: Auth-Token

   Returns 200 OK on Success and 401 Unauthorized if no user found or incorrect user data.

   **Request:**

   ```
   {
     username: username,
     password: password
   }
   ```

   **Response:**

   ```
   {
     "user": {
      "username": "username",
      "auth_token": "7774743beeb3c26dfdd80213ba1b9097",
      "avatar": "http://s3.amazonaws.com/milkninja/users/avatars/000/000/017/original/daisy_pollen_flower_220533.jpg?1461781531"
     }
   }
   ```

#### POST /place

   This adds a place to our database
      Params:
      * TBD
      * header: Auth-Token

      Returns 200 OK on Success and 401 Unauthorized if no user found or incorrect user data.

      **Request:**

      ```
      {
        "name": "Nordstrom Phipps Plaza",
        "address": "3500 Peachtree RD NE Atlanta,GA 30326",
        "description": "Dedicated Moms room 2nd floor Women's Apparel ",
        "lat": "33.8528444",
        "long": "-84.3622208"
      }
      ```

      **Response:**

      ```
      {
        "place": {
          TBD
        }
      }
      ```
== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
