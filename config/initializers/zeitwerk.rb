# frozen_string_literal: true

Rails.autoloaders.each do |autoloader|
  autoloader.inflector.inflect(
    'html_sanitizer' => 'HTMLSanitizer',
    'check_url_uniqueness' => 'CheckURLUniqueness'
  )
end
