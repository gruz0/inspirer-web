# frozen_string_literal: true

module Types
  include Dry.Types()

  Coercible::FloatWithComma = Types::Float.constructor { |f| Float(f.to_s.tr(',', '.')) if f }
  Coercible::Notes = Types::String.constructor { |s| Sanitize.new(remove_contents: true).fragment(s.to_s).strip if s }
end
