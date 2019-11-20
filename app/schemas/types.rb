# frozen_string_literal: true

module Types
  include Dry.Types()

  Coercible::FloatWithComma = Types::Float.constructor { |f| Float(f.to_s.tr(',', '.')) if f }
end
