# frozen_string_literal: true

class FindByCreatedToday
  def call(klass)
    klass.find_by('DATE(created_at) = ?', Date.current)
  end
end
