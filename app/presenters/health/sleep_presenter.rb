# frozen_string_literal: true

module Health
  class SleepPresenter
    attr_reader :sleep

    def initialize(sleep)
      @sleep = sleep
    end

    def woke_up_at
      "#{with_leading_zero(sleep.woke_up_at_hour)}:#{with_leading_zero(sleep.woke_up_at_minutes)}"
    end

    private

    def with_leading_zero(value)
      value.to_s.length == 1 ? "0#{value}" : value
    end
  end
end
