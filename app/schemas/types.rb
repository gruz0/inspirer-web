# frozen_string_literal: true

module Types
  include Dry.Types()

  Coercible::FloatWithComma = Types::Float.constructor { |f| Float(f.tr(',', '.')) if f }
end
