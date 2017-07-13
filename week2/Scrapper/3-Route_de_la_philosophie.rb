require 'rubygems'
require 'nokogiri'
require 'uri'
require 'open-uri'

START_URL = "https://en.wikipedia.org/wiki/Special:Random"
START_URL2 = "https://en.wikipedia.org/wiki/Semiotics"

def get_link(start_url)
	start_archive = ''
	start_url_archive = ''
	whole_link = start_url
	counter = 0
	loop do
		counter += 1
		page = Nokogiri::HTML(open(whole_link))
		link = remove_parenthese_link(page)
		whole_link = "https://en.wikipedia.org#{link}"
		puts counter
		puts "Now: #{page.css('title').text}"
		if counter == 1
			start_archive = page.css('title').text
			start_url_archive = page.xpath('/html/head/link[11]/@href')
		end
		puts "Next: #{whole_link}"
		break if whole_link == "https://en.wikipedia.org/wiki/Verificationism"
	end
	puts "\nVerificationism scan finished!\n
	#{counter} steps from #{start_archive} to Verificationism\n
	Go try it yourself! => #{start_url_archive}"
end
def remove_parenthese_link(url)
	first_paragraph = url.xpath('//div/p[1]')
	first_paragraph = first_paragraph.to_s.gsub(/\([^()]*\)/,'')
	first_paragraph = Nokogiri::HTML(first_paragraph)
	link = first_paragraph.xpath('//p[1]/a[1]/@href')
	link

end
#def get_canonical(url)
#	page = Nokogiri::HTML(open(url))
#	link = page.xpath('/html/head/link[11]/@href')
#	puts link
#
#end

get_link(START_URL)