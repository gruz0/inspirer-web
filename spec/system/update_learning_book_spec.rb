# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Learning Book', type: :system do
  let(:account) { create(:account) }
  let(:learning_book) do
    create(:learning_book,
           title: 'Book Title',
           author: 'Book Author',
           url: 'http://example.com',
           status: 'reading_now',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_learning_book_path(learning_book) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_learning_book_path(learning_book)

      fill_in 'learning_book[title]', with: 'New Title'
      fill_in 'learning_book[author]', with: 'New Author'
      fill_in 'learning_book[url]', with: 'http://example.com/test'
      select 'finished', from: 'learning_book[status]'
      select 'good', from: 'learning_book[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_learning_books_path' do
      expect(page).to have_current_path(my_learning_books_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Title' => 'New Title', 'Author' => 'New Author', 'Status' => 'finished', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_books', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit edit_my_learning_book_path(learning_book)

      fill_in 'learning_book[title]', with: ' '

      click_button 'Save'
    end

    it 'renders errors count' do
      expect(page).to have_text('1 error prohibited this learning book from being saved')
    end
  end
end
