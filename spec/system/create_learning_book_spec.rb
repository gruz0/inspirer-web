# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Learning Book', type: :system do
  let(:account) { create(:account) }

  before do
    sign_in(account)
  end

  context 'with valid inputs' do
    before do
      visit new_my_learning_book_path

      fill_in 'learning_book[title]', with: 'Book Title'
      fill_in 'learning_book[author]', with: 'Book Author'
      fill_in 'learning_book[url]', with: 'http://example.com/test'
      select 'want_to_read', from: 'learning_book[status]'
      select 'good', from: 'learning_book[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_learning_books_path' do
      expect(page).to have_current_path(my_learning_books_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      # FIXME: It should be replaced with link matcher
      rows = [{ 'Title' => 'Book Title', 'Author' => 'Book Author', 'Status' => 'want_to_read', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_books', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      visit new_my_learning_book_path

      fill_in 'learning_book[url]', with: 'example.com/test'

      click_button 'Save'
    end

    it 'redirects to my_learning_books_path' do
      expect(page).to have_current_path(my_learning_books_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('4 errors prohibited this learning book from being saved')
    end

    it 'renders error message if title is blank' do
      expect(page).to have_text('Title can\'t be blank')
    end

    it 'renders error message if url is not valid' do
      expect(page).to have_text('Url is not a valid URL')
    end

    it 'renders error message if status is blank' do
      expect(page).to have_text('Status can\'t be blank')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('Feeling can\'t be blank')
    end
  end

  it_behaves_like 'value is too long', 'learning_book', 'title', 'Title' do
    let(:path) { new_my_learning_book_path }
  end

  it_behaves_like 'value is too long', 'learning_book', 'author', 'Author' do
    let(:path) { new_my_learning_book_path }
  end
end
