#!/usr/bin/env ruby

require 'soda/client'

client = SODA::Client.new({:domain => "data.ny.gov", :app_token => ENV["NYDATAAPITOKEN"]})

results = client.get("gvhy-7eph", {"$limit" => 50000, "$order" => "create_time", :county => "Monroe", :facility_name => "NY 96", :event_type => "multi vehicle accident"})

puts "Got #{results.count} results. Dumping first results:"
results.each do |key, value|
  puts "#{key}: #{value}"
end
