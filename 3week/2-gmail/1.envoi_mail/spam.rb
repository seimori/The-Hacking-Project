require 'gmail'
require 'google_drive'
require 'rubygems'
USERMAIL = ""
PASSWORD = ""

def send_mail
	mail_hash = Hash.new
session = GoogleDrive::Session.from_config("spreadsheet-config.json")
# https://docs.google.com/spreadsheets/d/1zedotRYeXf2lqIsglHPSGjmYMHZdtOWrRPIpUDbwn3U/edit?usp=sharing
worksheet = session.spreadsheet_by_key("1zedotRYeXf2lqIsglHPSGjmYMHZdtOWrRPIpUDbwn3U").worksheets[0]
(1..worksheet.num_rows).each do |row|
	mail_hash[worksheet[row, 1]] = worksheet[row, 2]
end
puts mail_hash
gmail = Gmail.connect!(USERMAIL, PASSWORD)
mail_hash.each do |name, mail|
	gmail.deliver do
		to mail
		subject "Hello #{name}"
		html_part do
			body "<p>Hi there #{name}! So happy to <strong><span style='color:orange;'>TURTLE</span> <span style='color:red;'>SPAM!</span></strong> you!</p>"
		end
		add_file "/home/seimori/Pictures/random-turtle.gif"		
	end
end
	gmail.logout
end


send_mail