# README

This web app provides a simple weather forecast for any address in the United States

Using Rails 7.0.8 & ruby 3.0.3p157 (2021-11-24 revision 3fb7d2cadc) [x86_64-darwin20]

The address input uses the Google Place autocomplete widget to search for a valid US address and provide the zip code and latitude/longitude required to query the weather API.  You will need to obtain and use your own API KEY from google to use the widget. You can find more info about the Google Place Autocomplete widget here: https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete. You can find more info about obtaining a Google place API key here: https://developers.google.com/maps/documentation/places/web-service/get-api-key. Replace YOUR_API_KEY_HERE with you API KEY in in the application layout

The forecast service uses the free weather API provided by https://open-meteo.com/.  You can find more info and documentation there. The forecast service is located in /app/services/forecast_service.rb

The weather forecast is cached for 30 minutes using redis and the API call to open-mateo is done using httparty.  These gems needs to be included in your gemfile:

gem 'httparty'
gem 'redis'
