# frozen_string_literal: true

class FindByCreatedToday
  def call(klass)
    klass.exists?(['DATE(created_at) = ?', Date.current])
  end
end
