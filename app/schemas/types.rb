# frozen_string_literal: true

module Types
  include Dry.Types()

  Coercible::FloatWithComma = Types::Float.constructor { |f| Float(f.to_s.tr(',', '.')) if f }

  Coercible::SanitizedHTML = Types::String.constructor do |content|
    Sanitize.new(remove_contents: true).fragment(content.to_s).strip if content
  end
end
