# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Learning Article', type: :system do
  let(:account) { create(:account) }
  let(:learning_article) do
    create(:learning_article,
           url: 'http://domain.tld',
           title: 'Some Text',
           feeling: 'amazing',
           account: account)
  end

  before do
    sign_in(account)
  end

  context 'with valid inputs' do
    before do
      visit edit_my_learning_article_path(learning_article)

      fill_in 'learning_article[url]', with: 'http://example.com/test'
      fill_in 'learning_article[title]', with: 'Article Title'
      select 'good', from: 'learning_article[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_learning_articles_path' do
      expect(page).to have_current_path(my_learning_articles_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      values = {
        'Article' => 'Article Title',
        'Feeling' => 'good'
      }

      expect(find('#learning_articles')).to have_table_row(values)
    end
  end
end
