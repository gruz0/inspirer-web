# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Learning::Videos::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:learning_video) { account.learning_video.new }

  let(:input) do
    {
      resource: learning_video,
      attributes: {
        url: ' https://example.com/123  ',
        title: ' Awesome Video ',
        feeling: 'good',
        notes: html_ipsum('My Notes')
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns url' do
    expect(resource.url).to eq('https://example.com/123')
  end

  it 'assigns title' do
    expect(resource.title).to eq('Awesome Video')
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(resource.notes).to eq('My Notes')
  end
end
