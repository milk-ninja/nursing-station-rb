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

  Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

  **Request:**

  ```
  {
    "first_name": "Mallerie"
    "last_name": "Shirley"
    "username": "username"
    "email": "email@email.com"
    "password": "password"
    "zipcode": "00000"
    "avatar": "daisy_pollen_flower_220533.jpg"

  }
  ```

  **Response:**

  ```
  {
    "user": {
      "id": 1,
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
       "id": 1,
      "username": "username",
      "auth_token": "7774743beeb3c26dfdd80213ba1b9097",
      "avatar": "http://s3.amazonaws.com/milkninja/users/avatars/000/000/017/original/daisy_pollen_flower_220533.jpg?1461781531"
     }
   }
   ```

#### POST /places

   This adds a place to our database
      Params:
      * header: Auth-Token

      Returns 200 OK on Success and 401 Unauthorized if no user found or incorrect place data.

      **Request:**

      ```
      {
        "name": "Nordstrom Phipps Plaza",
        "street": "3500 Peachtree RD NE,
        "city": Atlanta,
        "state": "GA",
        "zip": 30326,
        "description": "Dedicated Moms room 2nd floor Women's Apparel ",
        "avatar": "daisy_pollen_flower_220533",
        "privacy": "4",
        "cleanliness": "4",
        "comment": "Super Nice!"
      }
      ```

      **Response:**

      ```
      {
        "place": {
          "name": "Nordstrom Phipps Plaza",
          "full_address": "3500 Peachtree RD NE Atlanta,GA 30326",
          "description": "Dedicated Moms room 2nd floor Women's Apparel ",
          "lat": "33.8528444",
          "lng": "-84.3622208",
          "avatar_url": "http://milkninja.s3.amazonaws.com/images/images/000/000/001/original/daisy_pollen_flower_220533.jpg?1462307263"
        }
      }
      ```

#### GET /places/find_nearby

    This returns the listing of places in our database near current location
      Params:
      * header: Auth-Token
      * lat: 00.00
      * long: -00.00

      Returns 200 OK on Success and 401 Unauthorized if no user found or incorrect data
      Note you will want to save the id of the place to the object using to list them will need it view a specific listing
      Note "privacy" & "cleanliness" below are the averages of the ratings of that place may be decimal

      **Response**

      ```
        {
          "places":[
          {"id": 6,"name":"Nordstrom Phipps Plaza","full_address":"3500 Peachtree Rd NE Atlanta,GA 30326","lat":33.7445406,"lng":-84.34266,"avatar_url":"http://milkninja.s3.amazonaws.com/images/images/000/000/001/original/daisy_pollen_flower_220533.jpg?1462307263","privacy": "4","cleanliness": "4"},
          {"id": 7,"name":"Iron Yard","full_address":"115 M.L.K. Dr. Atlanta,GA 30306,"lat":33.8808067,"lng":-84.333477","avatar_url":http://milkninja.s3.amazonaws.com/images/images/000/000/001/original/daisy_pollen_flower_220533.jpg?1462307263", "privacy": "4", "cleanliness": "4"}]
        }
      ```

#### GET /places/:id

    This pulls all the details associated with this specific place posting
      params:
      * header: Auth_token

      Returns 200 OK on Success and 401 Unauthorized if no current user or incorrect data

      **Request**

      ```
        {
          "id": 9
        }
      ```

      **Response**

      ```
      {
        "place": {
          "id": 7,
          "name": "Whole Foods",
          "full_address": "2111 Briarcliff Rd NE, Atlanta, GA, 30329",
          "description": "Super Nice!"},
          "ratings": [
          {
            "user_id": null,
            "privacy": 4,
            "cleanliness": 4,
            "comment": "Super Nice!",
            "images": [
            {
              "image": "http://milkninja.s3.amazonaws.com/images/images/000/000/001/original/daisy_pollen_flower_220533.jpg?1462307263"
            }
            ]
          }
          ]
        }
      ```
#### POST /places/:place_id/ratings

    This adds your rating to our database
      Params:
      * header: Auth-Token

      Returns 200 OK on Success and 401 Unauthorized if no user found or incorrect user data.
      ":" in front of a key means client must supply this key in the path for the path to work

      **Request:**

      ```
        {
          "place_id": 1,
          "user_id": 7,
          "comment": "Decent nothing special",
          "privacy": 3,
          "cleanliness": 3,
          "image": "http://milkninja.s3.amazonaws.com/images/images/000/000/001/original/daisy_pollen_flower_220533.jpg?1462307263"
        }
      ```

      **Response:**

      ```
        {
          "rating": {
            "user_id": 7,
            "place_id": 1,
            "comment": "Decent nothing special",
            "privacy": 3,
            "cleanliness": 3},
            "image": "http://milkninja.s3.amazonaws.com/images/images/000/000/001/original/daisy_pollen_flower_220533.jpg?1462307263"            
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
