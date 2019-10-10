# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'robot@inspirer.app'
  layout 'mailer'
end
