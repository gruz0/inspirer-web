# frozen_string_literal: true

return unless Rails.env.development?

ActiveRecordQueryTrace.enabled = true
ActiveRecordQueryTrace.colorize = :light_red
