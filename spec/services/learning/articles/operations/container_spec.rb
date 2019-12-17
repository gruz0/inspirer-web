# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Learning::Articles::Operations::Container do
  subject(:container) { described_class }

  it 'has build operation' do
    expect(container['build']).to be_instance_of(Shared::Operations::Build)
  end

  it 'has check_url_uniqueness operation' do
    expect(container['check_url_uniqueness']).to be_instance_of(Learning::Articles::Operations::CheckURLUniqueness)
  end

  it 'has assign_attributes operation' do
    expect(container['assign_attributes']).to be_instance_of(Learning::Articles::Operations::AssignAttributes)
  end

  it 'has persist operation' do
    expect(container['persist']).to be_instance_of(Shared::Operations::Persist)
  end
end
