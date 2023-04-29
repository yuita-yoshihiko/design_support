class YoutubeApi < ApplicationRecord
  belongs_to :design_tip
  require 'google/apis/youtube_v3'
  def self.get_thumbnail(design_tip)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:youtube_key]

    if design_tip.medium == 'movie'
      url = design_tip.url
      video_id = url.split('v=').last
      video_response = youtube.list_videos('snippet', id: video_id)
      thumbnails = video_response.items.first.snippet.thumbnails
      thumbnail_url = thumbnails.high.url
    end
  end
end