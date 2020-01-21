# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Learning::Books::Operations::AssignAttributes do
  subject(:operation) { described_class.new.call(input) }

  let(:result) { operation.value![:resource] }
  let(:resource) { build_stubbed(:learning_book, created_at: '2020-01-18 15:15:30') }

  let(:input) do
    {
      resource: resource,
      attributes: {
        title: ' Awesome Book ',
        author: ' My Author ',
        url: ' https://example.com/123  ',
        status: 'finished',
        feeling: 'good',
        notes: html_ipsum('My Notes'),
        created_at: '2020-01-19 15:31:12'
      }
    }
  end

  it { is_expected.to be_success }

  it 'assigns title' do
    expect(result.title).to eq('Awesome Book')
  end

  it 'assigns author' do
    expect(result.author).to eq('My Author')
  end

  it 'assigns url' do
    expect(result.url).to eq('https://example.com/123')
  end

  it 'assigns status' do
    expect(result.status).to eq('finished')
  end

  it 'assigns feeling' do
    expect(result.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(result.notes).to eq('My Notes')
  end

  it 'assigns created_at' do
    expect(result.created_at).to eq(Time.zone.parse('2020-01-19 15:31:12'))
  end

  context "when the created_at's value is not set" do
    before { input[:attributes][:created_at] = nil }

    it 'does not change' do
      expect(result.created_at).to eq(Time.zone.parse('2020-01-18 15:15:30'))
    end
  end
end
