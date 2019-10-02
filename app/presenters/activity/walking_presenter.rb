# frozen_string_literal: true

module Activity
  class WalkingPresenter
    attr_reader :walking

    def initialize(walking)
      @walking = walking
    end

    def distance
      walking.distance.round(2)
    end
  end
end
