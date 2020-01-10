# frozen_string_literal: true

module ApplicationHelper
  def page_title(title)
    title.presence || t('views.layout.title')
  end

  # FIXME: It should be deleted after updates all #index views
  def long_date(value)
    l(value, format: :long)
  end

  def human_readable_date(date)
    content_tag(:abbr, title: l(date, format: :long)) do
      time_tag(date) do
        "#{distance_of_time_in_words(date, Time.zone.now, include_seconds: true)} ago"
      end
    end
  end

  def hash_to_options(hash)
    hash.map { |k, v| [v, k] }
  end
end
