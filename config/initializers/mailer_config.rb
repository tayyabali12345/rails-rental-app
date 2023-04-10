# frozen_string_literal: true

Rails.application.configure do
  ActionMailer::Base.default_url_options = { host: 'localhost', port: 3000 }

  if Rails.env.development?
    ActionMailer::Base.delivery_method = :letter_opener_web
    ActionMailer::Base.perform_deliveries = true
  else
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      address: ENV['SMTP_ADDRESS'] || 'smtp.sendgrid.net',
      port: '587',
      authentication: :plain,
      user_name: 'noreply-pa@maplehr.io',
      password: ' ',
      enable_starttls_auto: true
    }
  end
end
