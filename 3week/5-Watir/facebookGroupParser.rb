require 'watir'
#require 'pry'
#
#
# Enter group url and facebook credentials before using
#
#
GROUP_URL = ""
FB_MAIL = ""
FB_PASSWORD = ""

class FacebookGroupParser
  def initialize(group_url)
    @b = Watir::Browser.new :firefox
    @b.goto group_url
  end

  def log_in_to_facebook
    fb_mail = @b.text_field(id: "email")
    fb_pw = @b.text_field(id: "pass")
    fb_mail.wait_until_present
    fb_mail.set("FB_MAIL")
    fb_pw.set("FB_PASSWORD")
    fb_log = @b.button(id: "loginbutton")
    fb_log.click
  end
  def see_more
    see_more_btn = @b.link(class: 'uiMorePagerPrimary')
    while see_more_btn.visible?
      see_more_btn.click
      sleep 3
    end
  end
  def get_names
    @b.divs(class: "fsl").each { |div| p div.a.text}
  end
  def perform
    log_in_to_facebook
    see_more
    get_names
    browser.close
  end

end

fcc = FacebookGroupParser.new(GROUP_URL)
fcc.perform


#binding.pry
#puts "End of code"
