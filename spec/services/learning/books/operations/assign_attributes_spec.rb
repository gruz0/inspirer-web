# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Learning::Books::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:learning_book) { account.learning_book.new }

  let(:input) do
    {
      resource: learning_book,
      attributes: {
        title: ' Awesome Book ',
        author: ' My Author ',
        url: ' https://example.com/123  ',
        status: 'finished',
        feeling: 'good',
        notes: html_ipsum('My Notes')
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns title' do
    expect(resource.title).to eq('Awesome Book')
  end

  it 'assigns author' do
    expect(resource.author).to eq('My Author')
  end

  it 'assigns url' do
    expect(resource.url).to eq('https://example.com/123')
  end

  it 'assigns status' do
    expect(resource.status).to eq('finished')
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(resource.notes).to eq('My Notes')
  end
end
