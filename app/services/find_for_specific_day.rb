# frozen_string_literal: true

class FindForSpecificDay
  def call(resource, date)
    resource.class.find_by('DATE(created_at) = ? AND account_id = ?', date, resource.account_id)
  end
end
