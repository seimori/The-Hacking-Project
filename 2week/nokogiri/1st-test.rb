require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://en.wikipedia.org/wiki/HTML"

page = Nokogiri::HTML(open(PAGE_URL))
page.css("div#content.mw-body div#bodyContent.mw-body-content div#mw-content-text.mw-content-ltr div.mw-parser-output table.infobox tr th").each do |category|
	puts category.text
end