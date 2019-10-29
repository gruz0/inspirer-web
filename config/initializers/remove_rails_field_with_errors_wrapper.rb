# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, _|
  # rubocop:disable Rails/OutputSafety
  html_tag.html_safe
  # rubocop:enable Rails/OutputSafety
end
