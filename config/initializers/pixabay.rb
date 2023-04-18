PIXABAY_BASE_URL = "https://pixabay.com/api/"

PIXABAY_API_KEY = Rails.application.credentials.dig(:pixabay, :key)

PIXABAY_CLIENT = Faraday.new(url: PIXABAY_BASE_URL) do |faraday|
  faraday.request  :url_encoded
  faraday.adapter  Faraday.default_adapter
end