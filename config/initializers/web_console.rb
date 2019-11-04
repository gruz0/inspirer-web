# frozen_string_literal: true

return unless Rails.env.development?

Rails.application.config.web_console.permissions = ['10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16']
