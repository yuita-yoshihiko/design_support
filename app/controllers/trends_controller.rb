class TrendsController < ApplicationController
  skip_before_action :require_login

  def index
    agent = Mechanize.new
    page_photoshopvip = agent.get('https://photoshopvip.net/')
    @photoshopvip = page_photoshopvip.search('.title a')
    @img = page_photoshopvip.search('img')

    page_webdesignclip = agent.get('https://webdesignclip.com/')
    webdesignclip = page_webdesignclip.search('.post_title a')
    img_second = page_webdesignclip.search('img')
    @webdesignclip = webdesignclip.slice(0, 3)
    @img_second = img_second.slice(1, 3)
  end
end
