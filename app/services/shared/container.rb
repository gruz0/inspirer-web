# frozen_string_literal: true

module Shared
  Container = Dry::Container::Namespace.new('shared') do
    register('validate') { Operations::Validate.new }
    register('build') { Operations::Build.new }
    register('must_be_created_once_per_day') { Operations::MustBeCreatedOncePerDay.new }
    register('check_url_uniqueness') { Operations::CheckURLUniqueness.new }
    register('persist') { Operations::Persist.new }
    register('fetch_link_title') { Operations::FetchLinkTitle.new }
  end
end
