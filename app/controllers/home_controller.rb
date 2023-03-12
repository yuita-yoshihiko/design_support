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
