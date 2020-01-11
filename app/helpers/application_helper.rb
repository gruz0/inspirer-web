# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def page_title(title)
    title.presence || t('views.layout.title')
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
