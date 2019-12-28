# frozen_string_literal: true

module Health
  class BodyMeasurePresenter
    attr_reader :body_measure

    def initialize(body_measure)
      @body_measure = body_measure
    end

    def chest
      if inch?
        convert_decimal_inches(body_measure.chest)
      else
        body_measure.chest.floor(1)
      end
    end

    def waist
      if inch?
        convert_decimal_inches(body_measure.waist)
      else
        body_measure.waist.floor(1)
      end
    end

    def hips
      if inch?
        convert_decimal_inches(body_measure.hips)
      else
        body_measure.hips.floor(1)
      end
    end

    private

    def inch?
      body_measure.unit == BODY_MEASURE_UNITS[:inch]
    end

    # http://syzygy.virtualave.net/decimal_inch_to_fractions.html
    def convert_decimal_inches(value, denominator = 16)
      # Subtract the number of whole inches
      fixed = value.floor

      # Subtract modulo
      modulo = value.modulo(1).floor(2)

      # Multiply module and denomiator to get the number of denominator's inches remaining
      fraction = (modulo * denominator).round

      "#{fixed} #{fraction}/#{denominator}"
    end
  end
end
