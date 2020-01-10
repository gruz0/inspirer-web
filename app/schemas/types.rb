# frozen_string_literal: true

module Types
  include Dry.Types()

  Coercible::FloatWithComma = Types::Float.constructor { |f| Float(f.to_s.tr(',', '.')) if f }
  StrippedString = Types::String.constructor(&:strip)
  Feeling = Types::Symbol.enum(FEELINGS)
end
