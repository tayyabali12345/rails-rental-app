# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply-pa@maplehr.io'
  layout 'mailer'
end
