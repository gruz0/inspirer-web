# frozen_string_literal: true

module Shared
  Container = Dry::Container::Namespace.new('shared') do
    register('validate') { Operations::Validate.new }
    register('build') { Operations::Build.new }
    register('must_be_created_once_per_day') { Operations::MustBeCreatedOncePerDay.new }
    register('persist') { Operations::Persist.new }
  end
end
