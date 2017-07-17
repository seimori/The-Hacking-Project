#!/usr/bin/env ruby
require 'twitter'

client = Twitter::REST::Client.new do |config|
	config.consumer_key = ENV["twitter_consumer_key"]
	config.consumer_secret = ENV["twitter_consumer_secret"]
	config.access_token = ENV["twitter_access_token"]
	config.access_token_secret = ENV["twitter_access_token_secret"]

end

tel_contacts = Hash.new()
client.search("nous contacter 06").each do |tweet|
#	number = "#{tweet.text}"[%r{(\d{2})\W?(\d{2})\W?(\d{2})\W?(\d{2})\W?(\d{2})}]
	number = "#{tweet.text}"[%r{((\d\d)(?:\W?)){4}(\d\d)}]
	tel_contacts["#{tweet.user.screen_name}".to_sym] = number unless number==nil
end
puts tel_contacts