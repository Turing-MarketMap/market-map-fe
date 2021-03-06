# MarketMap: A Turing 2110 BE Mod 3 Consultancy Project

![languages](https://img.shields.io/github/languages/top/Turing-MarketMap/market-map-fe?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/Turing-MarketMap/market-map-fe)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-6-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->



## Background & Description:
"MarketMap" is a group project built over the course of 10 days in Turing's module 3 backend program. It is an application that helps users understand how much a used car should cost. It uses a data visualization to explain how the cost of various makes and models change with mileage. It leverages Neural Network regressors to predict the expected price of any vehicle and plots this "fair price" trendline to show whether a particular listing is overpriced or underpriced. Users can save their favorite listings for easy reference as they search for used cars to buy. See below for more details on the frontend features.

## Screenshots of the Interface
#### Before Login:
![image](https://user-images.githubusercontent.com/78194232/160194813-a9f7eeca-7cba-4709-b09c-88e58e2b0e98.png)

#### After Login
![image](https://user-images.githubusercontent.com/78194232/160195123-95fb9fae-52f7-4686-bd3a-9b71c011bd05.png)

#### Listing Detail Page
![image](https://user-images.githubusercontent.com/78194232/160195403-ff85e140-d9ee-49a6-a3bd-47d3479c86d5.png)

#### User Profile Page
![image](https://user-images.githubusercontent.com/78194232/160195496-2864c6ca-e3fc-4224-a5bb-c78b5d669c6a.png)


## Frontend Features:
- Consumption of Google Image API to find images for the listings
- Consume the endpoints exposed by the MarketMap backend
- Integrate a chart with user/friendly features
- Implement Circle CI
- Implement OAuth using OmniAuth to sign in with Google
- Build a project with Service Oriented Architecture (SOA)

## Backend Features:
- Implemented ML trendlines for used car price database
- Utilized Bonjan Tunguz, Used Car Price ML Database on [Kaggle](https://www.kaggle.com/tunguz/used-car-auction-prices)

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
- ruby-fann
- -daru

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
- ruby-fann

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
 - Open Web Broswer and visit http://localhost:5000/
   - Please visit below endpoints to see JSON data being exposed

## Testing
 - Test using the terminal utilizing RSpec
 ```shell
 $ rspec spec/<follow directory path to test specific files>
 ```
   or test the whole suite with `$ rspec`

## Heroku Hosting Locations
 - [Frontend Heroku Dashboard](https://consultancy-fe.herokuapp.com/)
 - [Backend Github Market Map Repo](https://github.com/Turing-MarketMap/market-map)

## External API Endpoint
### Google Image Search API
- Google Image Search
  - Search Custom Google Image API for car images matching car listing color
  - HTTP Response 200.
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

## Further Project Information
 - [Turing Project Details](https://backend.turing.edu/module3/projects/consultancy/)

## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/croixk"><img src="https://avatars.githubusercontent.com/u/20864043?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Croix (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=croixk" title="Code">????</a> <a href="#ideas-croixk" title="Ideas, Planning, & Feedback">????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=croixk" title="Tests">??????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajcroixk" title="Reviewed Pull Requests">????</a></td>
    <td align="center"><a href="https://github.com/Eldridge-Turambi"><img src="https://avatars.githubusercontent.com/u/87398716?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Eldridge (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=Eldridge-Turambi" title="Code">????</a> <a href="#ideas-Eldridge-Turambi" title="Ideas, Planning, & Feedback">????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=Eldridge-Turambi" title="Tests">??????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3AjEldridge-Turambi" title="Reviewed Pull Requests">????</a></td>  
    <td align="center"><a href="https://github.com/jacksonvaldez"><img src="https://avatars.githubusercontent.com/u/87635398?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Jackson (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=jacksonvaldez" title="Code">????</a> <a href="#ideas-jacksonvaldez" title="Ideas, Planning, & Feedback">????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=jacksonvaldez" title="Tests">??????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajjacksonvaldez" title="Reviewed Pull Requests">????</a></td>
    <td align="center"><a href="https://github.com/LelandCurtis"><img src="https://avatars.githubusercontent.com/u/15107515?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Leland (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=LelandCurtis" title="Code">????</a> <a href="#ideas-LelandCurtis" title="Ideas, Planning, & Feedback">????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=LelandCurtis" title="Tests">??????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3AjLelandCurtis" title="Reviewed Pull Requests">????</a></td>
    <td align="center"><a href="https://github.com/tjroeder"><img src="https://avatars.githubusercontent.com/u/78194232?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Tim (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=tjroeder" title="Code">????</a> <a href="#ideas-tjroeder" title="Ideas, Planning, & Feedback">????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=tjroeder" title="Tests">??????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajtjroeder" title="Reviewed Pull Requests">????</a></td>   
    <td align="center"><a href="https://github.com/kevingloss"><img src="https://avatars.githubusercontent.com/u/83426676?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Kevin (he/him)</b></sub></a><br /><a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=kevingloss" title="Code">????</a> <a href="#ideas-kevingloss" title="Ideas, Planning, & Feedback">????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/commits?author=kevingloss" title="Tests">??????</a> <a href="https://github.com/Turing-MarketMap/market-map-fe/pulls?q=is%3Apr+reviewed-by%3Ajkevingloss" title="Reviewed Pull Requests">????</a></td>

  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
