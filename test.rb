#!/usr/bin/env ruby

require 'soda/client'

client = SODA::Client.new({:domain => "data.ny.gov", :app_token => ENV["NYDATAAPITOKEN"]})

# populate results with https://data.ny.gov/Transportation/Motor-Vehicle-Crashes-Case-Information-Three-Year-/e8ky-4vqe dataset
results = client.get("w9dr-rq6v", {"$limit" => 50000, "$order" => "date", :"County Name" => "MONROE"})
#results = client.get("w9dr-rq6v", {"$limit" => 500000, "$order" => "date"})

#puts "Got #{results.count} results."
puts "Got #{results.count} results. Dumping results:"
results.first.each do |key, value|
	puts "#{key}: #{value}"
end
