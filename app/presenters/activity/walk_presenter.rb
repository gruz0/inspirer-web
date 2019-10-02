# frozen_string_literal: true

module Activity
  class WalkPresenter
    attr_reader :walk

    def initialize(walk)
      @walk = walk
    end

    def distance
      walk.distance.round(2)
    end
  end
end
