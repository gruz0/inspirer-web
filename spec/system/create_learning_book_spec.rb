# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Learning Book', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_learning_book_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_learning_book_path

      fill_in 'learning_book[title]', with: 'Book Title'
      fill_in 'learning_book[url]', with: 'http://example.com/test'
      select 'want_to_read', from: 'learning_book[status]'
      select 'good', from: 'learning_book[feeling]'
      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_learning_books_path' do
      expect(page).to have_current_path(my_learning_books_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      rows = [{ 'Title' => 'Book Title', 'Author' => '', 'Status' => 'want_to_read', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_books', with_rows: rows)
    end

    it 'renders clickable link' do
      expect(page).to have_link(nil, href: 'http://example.com/test', text: 'Book Title')
    end
  end

  context 'with empty inputs' do
    before do
      sign_in(account)

      visit new_my_learning_book_path

      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_learning_books_path' do
      expect(page).to have_current_path(my_learning_books_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('3 errors prohibited this learning book from being saved')
    end
  end
end
