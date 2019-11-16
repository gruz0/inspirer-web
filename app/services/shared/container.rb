# frozen_string_literal: true

module Shared
  Container = Dry::Container::Namespace.new('shared') do
    register('validate') { Operations::Validate.new }
    register('must_be_created_once_per_day') { Operations::MustBeCreatedOncePerDay.new }
  end
end
