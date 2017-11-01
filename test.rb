#!/usr/bin/env ruby

require 'soda/client'

client = SODA::Client.new({:domain => "data.ny.gov", :app_token => ENV["NYDATAAPITOKEN"]})

results = client.get("gvhy-7eph", {"$limit" => 50000, :county => "Monroe"})

puts "Got #{results.count} results. Dumping first results:"
results.first.each do |key, value|
  puts "#{key}: #{value}"
end
