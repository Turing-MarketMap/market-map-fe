# MarketMap: A Turing 2110 BE Mod 3 Consultancy Project

![languages](https://img.shields.io/github/languages/top/Turing-MarketMap/market-map-fe?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/Turing-MarketMap/market-map-fe)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-6-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->


## Background & Description:

"MarketMap" is a group project built over the course of 10 days in Turing's module 3 backend program. This project is a branch of Turing's Consultancy project. We pitched a rough concept of creating an application that would let a user search for cars listings and enable them to know if they were getting a good deal based other listings across the United States. See below for more details on the backend features.

## Frontend Features:
- Consuption of Google Image API to find images for the listings
- Consume the endpoints exposed by the MarketMap backend
- Integrate a chart with user/friendly features
- Implement OAuth using OmniAuth to sign in with Google
- Build a project with Service Oriented Architecture (SOA)

## Backend Features:
- Utilized Bonjan Tunguz, Used Car Price ML Database on [Kaggle](https://www.kaggle.com/tunguz/used-car-auction-prices).

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

## External API Endpoint
### Google Image Search API
- Google Image Search
  - Search Custom Google Image API for car images matching car listing color
  - Required Params:
    - `cx` Search Engine ID - data type `string` - default from env
    - `key` Google API Key - data type `string` - default from env
    - `imgDominantColor` Dominant Image Color - data type `string` - set by params
    - `q` Query - data type `string` - set by params
  - Given/Hardcoded Params:
    - `imgColorType` Image Color Type - data type `string` - hardcoded to `color`
    - `imgSize` Image Size - data type `string` - hardcoded to `LARGE`
    - `imgType` Image Type - data type `string` - hardcoded to `photo`
    - `searchType` Google Search Type - data type `string` - hardcoded to `image`
    - `num` Google Search Result Returns - data type `integer` - hardcoded to `1`
  - Base URI Path: `https://customsearch.googleapis.com/customsearch/v1` 
  - Example Request: `https://customsearch.googleapis.com/customsearch/v1?cx=<cx>&imgColorType=color&imgDominantColor=gray&imgSize=LARGE&imgType=photo&key=<key>&num=1&q=2014%20Acura%20ILX&searchType=image`
  - Example Response:
```json
{
  "kind": "customsearch#search",
  "url": {
    "type": "application/json",
    "template": "https://www.googleapis.com/customsearch/v1?q={searchTerms}&num={count?}&start={startIndex?}&lr={language?}&safe={safe?}&cx={cx?}&sort={sort?}&filter={filter?}&gl={gl?}&cr={cr?}&googlehost={googleHost?}&c2coff={disableCnTwTranslation?}&hq={hq?}&hl={hl?}&siteSearch={siteSearch?}&siteSearchFilter={siteSearchFilter?}&exactTerms={exactTerms?}&excludeTerms={excludeTerms?}&linkSite={linkSite?}&orTerms={orTerms?}&relatedSite={relatedSite?}&dateRestrict={dateRestrict?}&lowRange={lowRange?}&highRange={highRange?}&searchType={searchType}&fileType={fileType?}&rights={rights?}&imgSize={imgSize?}&imgType={imgType?}&imgColorType={imgColorType?}&imgDominantColor={imgDominantColor?}&alt=json"
  },
  "queries": {
    "request": [
      {
        "title": "Google Custom Search - 2014 Acura ILX",
        "totalResults": "17600000",
        "searchTerms": "2014 Acura ILX",
        "count": 1,
        "startIndex": 1,
        "inputEncoding": "utf8",
        "outputEncoding": "utf8",
        "safe": "off",
        "cx": "<cx>",
        "searchType": "image",
        "imgSize": "large",
        "imgType": "photo",
        "imgColorType": "color",
        "imgDominantColor": "gray"
      }
    ],
    "nextPage": [
      {
        "title": "Google Custom Search - 2014 Acura ILX",
        "totalResults": "17600000",
        "searchTerms": "2014 Acura ILX",
        "count": 1,
        "startIndex": 2,
        "inputEncoding": "utf8",
        "outputEncoding": "utf8",
        "safe": "off",
        "cx": "<cx>",
        "searchType": "image",
        "imgSize": "large",
        "imgType": "photo",
        "imgColorType": "color",
        "imgDominantColor": "gray"
      }
    ]
  },
  "context": {
    "title": "market-map-images"
  },
  "searchInformation": {
    "searchTime": 0.357155,
    "formattedSearchTime": "0.36",
    "totalResults": "17600000",
    "formattedTotalResults": "17,600,000"
  },
  "items": [
    {
      "kind": "customsearch#result",
      "title": "2014 Acura ILX Reliability - Consumer Reports",
      "htmlTitle": "\u003cb\u003e2014 Acura ILX\u003c/b\u003e Reliability - Consumer Reports",
      "link": "https://crdms.images.consumerreports.org/c_lfill,w_720,q_auto,f_auto/prod/cars/chrome/white/2014ACU008a_640_12",
      "displayLink": "www.consumerreports.org",
      "snippet": "2014 Acura ILX Reliability - Consumer Reports",
      "htmlSnippet": "\u003cb\u003e2014 Acura ILX\u003c/b\u003e Reliability - Consumer Reports",
      "mime": "image/",
      "fileFormat": "image/",
      "image": {
        "contextLink": "https://www.consumerreports.org/cars/acura/ilx/2014/reliability/",
        "height": 480,
        "width": 640,
        "byteSize": 43395,
        "thumbnailLink": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4PI4rGr4nH1GtXDgbalWOB3yuYxMWM-4Ij-ydBTAqG73LgtoVnVtpxw&s",
        "thumbnailHeight": 103,
        "thumbnailWidth": 137
      }
    }
  ]
}
```

## Internal API Endpoints
### Listings
 - Index
   - View listings (with optional filters)
   - Example Request: `https://consultancy-be.herokuapp.com/api/v1/listings`
   - Example Response:
```json
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
```json
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
```json
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
