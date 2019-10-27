# frozen_string_literal: true

class FetchLinkTitleWorker
  include Sidekiq::Worker
  include Import['rollbar', site_parser: 'utils.site_parser']

  def perform(model, record_id, url)
    tags = parse_tags(url)

    find_record(model, record_id).update!(title: tags[:title])
  rescue StandardError => e
    rollbar.error(e.message, model: model, record_id: record_id, url: url, title: tags.try(:title).presence)
  end

  private

  def parse_tags(url)
    site_parser.call(url)
  end

  def find_record(model, record_id)
    model.constantize.find(record_id)
  end
end
