require 'HTTParty'
require 'json'

class Tide < ApplicationRecord

start_date = '2021-12-22'
end_date = '2021-12-23'

lat = 43.4831519
lng = -1.558626

  def get_tide(lat, lng, start_date, end_date)
    headers = {
    "Authorization": "8902712a-5c25-11ec-b9d3-0242ac130002-89027206-5c25-11ec-b9d3-0242ac130002"
    }

    response = HTTParty.get(
      "https://api.stormglass.io/v2/tide/extremes/point?lat=#{lat}&lng=#{lng}&start=#{start_date}&end=#{end_date}",
      :headers => headers
    )

    tide_set = response["data"]

    puts "Here are the tides for the specified period : "
    puts ""
    tide_set.each do |tide_extreme|
        puts "Tide time (UTC +1) : #{Time.parse(tide_extreme["time"]).utc+1*60*60}"

        puts "Tide type : #{tide_extreme["type"]}"
        puts "Tide height : #{tide_extreme["height"]}"
        puts ""
    end
  end
end
