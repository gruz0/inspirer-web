# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Shared::Container do
  subject(:container) do
    Class.new do
      extend Dry::Container::Mixin
      import Shared::Container
    end
  end

  it 'has valid operations size' do
    expect(container.keys.size).to eq(5)
  end

  it 'has shared.validate operation' do
    expect(container['shared.validate']).to be_instance_of(Shared::Operations::Validate)
  end

  it 'has shared.build operation' do
    expect(container['shared.build']).to be_instance_of(Shared::Operations::Build)
  end

  it 'has shared.must_be_created_once_per_day operation' do
    expect(container['shared.must_be_created_once_per_day'])
      .to be_instance_of(Shared::Operations::MustBeCreatedOncePerDay)
  end

  it 'has shared.check_url_uniqueness operation' do
    expect(container['shared.check_url_uniqueness']).to be_instance_of(Shared::Operations::CheckURLUniqueness)
  end

  it 'has shared.persist operation' do
    expect(container['shared.persist']).to be_instance_of(Shared::Operations::Persist)
  end
end
