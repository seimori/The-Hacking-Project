require 'watir'
require 'pry'
browser = Watir::Browser.new :firefox
browser.goto 'google.com'
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Hello World!")
submit_button = browser.button(name: 'btnG')
submit_button.click
browser.driver.manage.timeouts.implicit_wait = 3
search_result_divs = browser.divs(class: 'rc')
search_result_divs.each{ |div|
  p div.h3.text
}
browser.close
binding.pry

puts "End of code"
