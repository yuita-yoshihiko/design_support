class PixabayApi
  BASE_URL = "https://pixabay.com/api/"
  API_KEY = Rails.application.credentials.dig(:pixabay, :key)

  def self.search_images(query)
    conn = Faraday.new(url: BASE_URL)
    response = conn.get("", {key: API_KEY, q: query, per_page: 12})
    json = JSON.parse(response.body)

    if json['hits']
      json['hits'].map do |image|
        image['webformatURL']
      end
    else
      []
    end
  end
end
