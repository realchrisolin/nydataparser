#!/usr/bin/env ruby

require 'soda/client'

client = SODA::Client.new({:domain => "data.ny.gov", :app_token => ENV["NYDATAAPITOKEN"]})

results = client.get("gvhy-7eph", {"$limit" => 50000, "$select" => "facility_name", "$group" => "facility_name", "$order" => "facility_name", :county => "Monroe"})

puts "Got #{results.count} results. Dumping results:"
results.each do |key, value|
  puts "#{key}: #{value}"
end
