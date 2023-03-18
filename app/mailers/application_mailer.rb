class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:smtp, :sender_address)
  layout 'mailer'
end
