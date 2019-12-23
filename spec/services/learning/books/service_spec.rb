# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Books::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.learning_book,
        attributes: attributes_for(:learning_book)
      }
    end

    it { is_expected.to be_success }
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :learning_book,
        title: 'My Book',
        author: 'Author',
        url: 'https://example.com',
        status: 'new_book',
        feeling: 'good'
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          title: '  Book Title ',
          author: '  My Author ',
          url: '  https://example.com/page1  ',
          status: 'finished',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Post')
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates title' do
      expect { result }.to change(resource.reload, :title).from('My Book').to('Book Title')
    end

    it 'updates author' do
      expect { result }.to change(resource.reload, :author).from('Author').to('My Author')
    end

    it 'updates url' do
      expect { result }.to change(resource.reload, :url).from('https://example.com').to('https://example.com/page1')
    end

    it 'updates status' do
      expect { result }.to change(resource.reload, :status).from('new_book').to('finished')
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('').to('Awesome Post')
    end
  end
end
