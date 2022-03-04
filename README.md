# MarketMap: A Turing 2110 BE Mod 3 Consultancy Project

![languages](https://img.shields.io/github/languages/top/Turing-MarketMap/market-map-fe?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/Turing-MarketMap/market-map-fe)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-6-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->


## Background & Description:

"MarketMap" is a group project built over the course of two weeks in Turing's module 3 backend program. This project is a branch of Turing's Consultancy project. We pitched a rough concept of creating an application that would let a user search for cars and enable them to know if they were getting a good deal based on several factors. See below for more details on the backend features.

## Frontend Features:
- Consume Google Image API to find images for the listings
- Consume the endpoints exposed by the MarketMap backend
- Integrate a chart with user/friendly features
- Implement OAuth using OmniAuth to sign in with Google
- Build a project with Service Oriented Architecture (SOA)

## Requirements and Setup (for Mac):
### Ruby and Rails
- Ruby -V 2.7.2
- Rails -V 5.2.6

### Gems Utilized
#### Development/Testing Environments
- rspec
- pry
- simplecov
- factory_bot_rails
- faker
- jsonapi-serializer
- figaro
- shoulda-matchers
- capybara
- webmock
- vcr
- faker
- factory_bot
#### Production Environment
- bootstrap
- faraday
- omniauth-google-oauth2
- omniauth-rails_csrf_protection
- jquery-rails
- simple_form
- popper_js
- tether-rails
- chartkick
- rails_12factor

### Setup
1. Fork and/or Clone this Repo from GitHub.
2. In your terminal use `$ git clone <ssh or https path>`
3. Change into the cloned directory using `$ cd market-map-fe`
4. Install the gem packages using `$ bundle install`
5. Startup and Access require the server to be running locally and a web browser opened.
  - Start Server
```shell
$ rails s
```
 - Open Web Broswer and visit http://localhost:3000/
   - Please visit below endpoints to see JSON data being exposed

## Testing
 - Test using the terminal utilizing RSpec
 ```shell
 $ rspec spec/<follow directory path to test specific files>
 ```
   or test the whole suite with `$ rspec`

## Endpoints
### Listings
 - Index
   - View listings (with optional filters)
   - Example Request: `https://consultancy-be.herokuapp.com/api/v1/listings`
   - Example Response:
```
{
  "data": [
    {
      "id": "1",
      "type": "listing",
      "attributes": {
        "year": 2014,
        "make": "Acura",
        "model": "ILX",
        "trim": "Technology Package",
        "body": "Sedan",
        "transmission": "automatic",
        "vin": "19vde1f70ee008913",
        "state": "ca",
        "condition": 2.5,
        "odometer": 9051,
        "color": "gray",
        "interior": "black",
        "sellingprice": 21250
       }
    },
    {
      "id": "2",
      "type": "listing",
      "attributes": {
        "year": 2014,
        "make": "Acura",
        "model": "MDX",
        "trim": "Advance and Entertainment Packages",
        "body": "SUV",
        "transmission": "automatic",
        "vin": "5fryd3h83eb011004",
        "state": "ca",
        "condition": 4.9,
        "odometer": 21523,
        "color": "white",
        "interior": "gray",
        "sellingprice": 41500
      }
     },...
```

- Show
   - View a listing (with optional filters)
   - Example Request: `https://consultancy-be.herokuapp.com/api/v1/listings/1`
   - Example Response:
```
{
  "data": {
    "id": "1",
    "type": "listing",
    "attributes": {
      "year": 2014,
      "make": "Acura",
      "model": "ILX",
      "trim": "Technology Package",
      "body": "Sedan",
      "transmission": "automatic",
      "vin": "19vde1f70ee008913",
      "state": "ca",
      "condition": 2.5,
      "odometer": 9051,
      "color": "gray",
      "interior": "black",
      "sellingprice": 21250
      }
    }
}
```

### Users
- Login/Register
  - Login or create a new user.
  - Example Request: `https://https://consultancy-be.herokuapp.com/api/v1/users`
- Destroy User
  - Delete a users account.
  - Example Request: `https://https://consultancy-be.herokuapp.com/users/1`
- User Listings
  - Can view listings that a user has saved
  - Example Request: `https://consultancy-be.herokuapp.com/api/v1/users/1/listings`
  - Example Response:
```
{
  "data": [
    {
      "id": "1",
      "type": "listing",
      "attributes": {
        "year": 2014,
        "make": "Acura",
        "model": "ILX",
        "trim": "Technology Package",
        "body": "Sedan",
        "transmission": "automatic",
        "vin": "19vde1f70ee008913",
        "state": "ca",
        "condition": 2.5,
        "odometer": 9051,
        "color": "gray",
        "interior": "black",
        "sellingprice": 21250
       }
    },
    {
      "id": "2",
      "type": "listing",
      "attributes": {
        "year": 2014,
        "make": "Acura",
        "model": "MDX",
        "trim": "Advance and Entertainment Packages",
        "body": "SUV",
        "transmission": "automatic",
        "vin": "5fryd3h83eb011004",
        "state": "ca",
        "condition": 4.9,
        "odometer": 21523,
        "color": "white",
        "interior": "gray",
        "sellingprice": 41500
       }
     }
    ]
}
```

### UserListings

## Further Project Information
 - [Turing Project Details](https://backend.turing.edu/module3/projects/consultancy/)
 - [Frontend Heroku Dashboard](https://consultancy-fe.herokuapp.com/)
 - [Backend Github Market Map Repo](https://github.com/Turing-MarketMap/market-map)


## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/croixk"><img src="https://avatars.githubusercontent.com/u/20864043?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Croix (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=croixk" title="Code">💻</a> <a href="#ideas-croixk" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=croixk" title="Tests">⚠️</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajcroixk" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/Eldridge-Turambi"><img src="https://avatars.githubusercontent.com/u/87398716?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Eldridge (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=Eldridge-Turambi" title="Code">💻</a> <a href="#ideas-Eldridge-Turambi" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=Eldridge-Turambi" title="Tests">⚠️</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3AjEldridge-Turambi" title="Reviewed Pull Requests">👀</a></td>  
    <td align="center"><a href="https://github.com/jacksonvaldez"><img src="https://avatars.githubusercontent.com/u/87635398?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Jackson (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=jacksonvaldez" title="Code">💻</a> <a href="#ideas-jacksonvaldez" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=jacksonvaldez" title="Tests">⚠️</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajjacksonvaldez" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/LelandCurtis"><img src="https://avatars.githubusercontent.com/u/15107515?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Leland (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=LelandCurtis" title="Code">💻</a> <a href="#ideas-LelandCurtis" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=LelandCurtis" title="Tests">⚠️</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3AjLelandCurtis" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/tjroeder"><img src="https://avatars.githubusercontent.com/u/78194232?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Tim (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=tjroeder" title="Code">💻</a> <a href="#ideas-tjroeder" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=tjroeder" title="Tests">⚠️</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajtjroeder" title="Reviewed Pull Requests">👀</a></td>   
    <td align="center"><a href="https://github.com/kevingloss"><img src="https://avatars.githubusercontent.com/u/83426676?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Kevin (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=kevingloss" title="Code">💻</a> <a href="#ideas-kevingloss" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=kevingloss" title="Tests">⚠️</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajkevingloss" title="Reviewed Pull Requests">👀</a></td>

  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
