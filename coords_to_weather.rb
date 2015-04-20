require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

url_of_forecast = "https://api.forecast.io/forecast/8df5e9a5877dc0f314a7795f78b8f6a3/"+ the_latitude + "," + the_longitude
raw_dataf = open(url_of_forecast).read
parsed_dataf = JSON.parse(raw_dataf)

# Ultimately, we want the following line to work when uncommented:

the_temperature = parsed_dataf["currently"]["temperature"]
the_hour_outlook = parsed_dataf["hourly"]["summary"]
the_day_outlook = parsed_dataf["daily"]["summary"]

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
