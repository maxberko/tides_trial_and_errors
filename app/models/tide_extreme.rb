# require 'HTTParty'
require 'json'

class TideExtreme < ApplicationRecord
  attr_accessor :type, :time, :height

  def get_tides(lat, lng, start_date, end_date)
    headers = {
    "Authorization": "8902712a-5c25-11ec-b9d3-0242ac130002-89027206-5c25-11ec-b9d3-0242ac130002"
    }

    response = HTTParty.get(
      "https://api.stormglass.io/v2/tide/extremes/point?lat=#{lat}&lng=#{lng}&start=#{start_date}&end=#{end_date}",
      :headers => headers
    )

    #tides is the variable storing all the tides for the specified location and time-frame
    tides = response["data"]

    puts "Here are the tides for the specified period : "

    tides.each do |tide_extreme|
        tide_extreme_time = Time.parse(tide_extreme["time"]).utc
        # use this if you only want to return UTC + 1 formatted time : tide_extreme_time = Time.parse(tide_extreme["time"]).utc+1*60*60

        tide_extreme_type = tide_extreme["type"]
        tide_extreme_height = tide_extreme["height"]
        # this loop goes through the tides in tide_set
        # and extracts the extreme_tide data
        # time of the extreme
        # type of the extreme (high, low)
        # height of the extreme

        save_tide_extreme(tide_extreme_time, tide_extreme_type, tide_extreme_height)
        #calling save_tide_extreme() to save each tide extreme into DB if it's not already there
    end
  end

  def save_tide_extreme(time, type, height)
    TideExtreme.new(time, type, height)
    puts ""
    puts "At the following time (UTC+1)  : #{tide_extreme_time}"
    puts "Tide type is : #{tide_extreme_type}"
    puts "Tide height is : #{tide_extreme_height}"
  end

end
