# frozen_string_literal: true

class FindByCreatedToday
  def self.call(klass)
    klass.find_by('DATE(created_at) = ?', Date.parse(Time.zone.now.to_s))
  end
end
