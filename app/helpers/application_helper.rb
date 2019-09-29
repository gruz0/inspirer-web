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
    if date > (Time.zone.now - 3.days)
      "#{distance_of_time_in_words(date, Time.zone.now, include_seconds: true)} ago"
    else
      l(date, format: :long)
    end
  end

  # FIXME: It should be replaced with hash_to_options
  def feelings_to_array
    FEELINGS.map { |k, v| [v, k] }
  end

  def weight_units_to_array
    hash_to_options(WEIGHT_UNITS)
  end

  private

  def hash_to_options(hash)
    hash.map { |k, v| [v, k] }
  end
end
