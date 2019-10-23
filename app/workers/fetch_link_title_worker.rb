# frozen_string_literal: true

class FetchLinkTitleWorker
  include Sidekiq::Worker
  include Import['rollbar', site_parser: 'utils.site_parser']

  def perform(model, record_id, url)
    tags = parse_tags(url)
    title = build_title(tags)

    raise StandardError, 'Could not find TITLE and H1 on the page' if title.blank?

    find_record(model, record_id).update!(title: title)
  rescue StandardError => e
    rollbar.error(e.message, model: model, record_id: record_id, url: url, title: title.presence)
  end

  private

  def parse_tags(url)
    site_parser.call(url)
  end

  def build_title(tags)
    tags[:h1].present? ? tags[:h1] : tags[:title]
  end

  def find_record(model, record_id)
    model.constantize.find(record_id)
  end
end
