# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Learning Book', type: :system do
  let(:account) { create(:account) }
  let(:learning_book) do
    create(:learning_book,
           title: 'Amazing Book',
           url: 'http://example.com',
           notes: 'My <b>Notes</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_learning_book_path(learning_book) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_learning_book_path(learning_book)
    end

    it 'has clickable title' do
      expect(page).to have_link(nil, href: 'http://example.com', text: 'Amazing Book')
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Notes', exact: true)
    end
  end
end
