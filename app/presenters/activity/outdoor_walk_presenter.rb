# frozen_string_literal: true

module Activity
  class OutdoorWalkPresenter
    attr_reader :outdoor_walk

    def initialize(outdoor_walk)
      @outdoor_walk = outdoor_walk
    end

    def distance
      outdoor_walk.distance.round(2)
    end
  end
end
