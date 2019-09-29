# frozen_string_literal: true

module Health
  class BodyMeasurePresenter
    attr_reader :body_measure

    def initialize(body_measure)
      @body_measure = body_measure
    end

    def chest
      if body_measure.inch?
        body_measure.chest.round(1)
      else
        body_measure.chest.round
      end
    end

    def waist
      if body_measure.inch?
        body_measure.waist.round(1)
      else
        body_measure.waist.round
      end
    end

    def hips
      if body_measure.inch?
        body_measure.hips.round(1)
      else
        body_measure.hips.round
      end
    end
  end
end
