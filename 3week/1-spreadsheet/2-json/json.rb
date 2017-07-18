#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'nokogiri'
require 'open-uri'
VAL_DOISE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(open(url))
	email = page.xpath('//table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p/font')
	#puts email.text
	email.text
end

def get_all_the_urls_of_val_doise_townhalls(url)
	towns_mail_list = Hash.new()
	page = Nokogiri::HTML(open(url))
	page.xpath('//table/tr[2]/td/table/tr/td/p/a').each do |town|
		town_name = town.text.downcase
		proper_town_name = town_name.capitalize
		town_name = town_name.split(' ').join('-')
		url = "http://annuaire-des-mairies.com/95/#{town_name}.html"
		towns_mail_list[proper_town_name.to_sym] = get_the_email_of_a_townhal_from_its_webpage(url)
	end
	#towns_mail_list.each do |key, value|
	#		puts "#{key}: #{value} "
	#end
	towns_mail_list
end

def mairies_json(file)
	File.open(file, "w") do |f|
		f.write(get_all_the_urls_of_val_doise_townhalls(VAL_DOISE_URL).to_json)
	end
end

mairies_json("input.json")