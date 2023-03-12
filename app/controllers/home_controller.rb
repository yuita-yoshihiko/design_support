class HomeController < ApplicationController
  skip_before_action :require_login

  def top
    @q = DesignTip.ransack(params[:q])
    @design_tips = @q.result(distinct: true)
  end

  def trend
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

  def for_beginner
  end

  def growing
  end

  def privacy_policy
  end

  def terms_of_use
  end
end
