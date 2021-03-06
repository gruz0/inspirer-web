# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Podcasts::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.learning_podcast,
        attributes: attributes_for(:learning_podcast)
      }
    end

    it { is_expected.to be_success }
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :learning_podcast,
        url: 'https://example.com',
        title: '',
        feeling: 'good',
        created_at: Time.zone.parse('2020-01-19 15:30:03')
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          url: '  https://example.com/page1  ',
          title: '  Page Title ',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Post'),
          created_at: '2020-01-18 12:15:31'
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates url' do
      expect { result }.to change(resource.reload, :url).from('https://example.com').to('https://example.com/page1')
    end

    it 'updates title' do
      expect { result }.to change(resource.reload, :title).from('').to('Page Title')
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('').to('Awesome Post')
    end

    it 'updates created_at' do
      expect { result }.to change(resource.reload, :created_at)
        .from(Time.zone.parse('2020-01-19 15:30:03'))
        .to(Time.zone.parse('2020-01-18 12:15:31'))
    end
  end
end
