class TrendsController < ApplicationController
  skip_before_action :require_login

  def index
    @photoshopvip, @img = Scraping.scrape_photoshopvip
    @webdesignclip, @img_second = Scraping.scrape_webdesignclip
  end
end
