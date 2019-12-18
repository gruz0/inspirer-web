# frozen_string_literal: true

Dry::Validation.register_macro(:url_format) do
  if value
    schemes = %w[http https].freeze

    uri    = URI.parse(value.strip)
    host   = uri&.host
    scheme = uri&.scheme

    valid_suffix   = host && PublicSuffix.valid?(host, default_rule: nil)
    valid_no_local = host&.include?('.')
    valid_scheme   = host && scheme && schemes.include?(scheme)

    key.failure('not a valid URL format') unless valid_scheme && valid_no_local && valid_suffix
  end
end