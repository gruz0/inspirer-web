# frozen_string_literal: true

module ApplicationHelper
  def page_title(title)
    title.presence || t('views.layout.title')
  end

  def long_date(value)
    l(value, format: :long)
  end

  def feelings_to_array
    FEELINGS.map { |k, v| [v, k] }
  end
end
