require 'gmail'
USERMAIL = ""
PASSWORD = ""

mail_list = ["issei.morimoto@gmail.com", "nana.fujiyama@gmail.com", "nicolas.tsan@gmail.com"]
gmail = Gmail.connect!(USERMAIL, PASSWORD)
	gmail.deliver do
		to mail_list
		subject "Testing gmail gem"
		html_part do
			body "<p><strong><span style='color:orange;'>TURTLE</span> <span style='color:red;'>SPAM!</span></strong></p>"
		end
		add_file "/home/seimori/Pictures/random-turtle.gif"
	end
gmail.logout

