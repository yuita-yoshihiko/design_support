RakutenWebService.configure do |c|
  c.application_id = Rails.application.credentials.dig(:rakuten, :api_key)
end
