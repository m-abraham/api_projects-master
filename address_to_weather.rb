require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
street_address = gets.chomp
url_safe_street_address = URI.encode(street_address)

# Your code goes below.
# Get Latitude and Longitude of Address.

url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address="+ url_safe_street_address
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)

the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

# Ultimately, we want the following line to work when uncommented:

url_of_forecast = "https://api.forecast.io/forecast/8df5e9a5877dc0f314a7795f78b8f6a3/"+ the_latitude.to_s + "," + the_longitude.to_s
raw_dataf = open(url_of_forecast).read
parsed_dataf = JSON.parse(raw_dataf)

the_temperature = parsed_dataf["currently"]["temperature"]
the_hour_outlook = parsed_dataf["hourly"]["summary"]
the_day_outlook = parsed_dataf["daily"]["summary"]


puts "The current temperature at #{street_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
