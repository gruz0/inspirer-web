# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Learning Article', type: :system do
  let(:account) { create(:account) }
  let(:learning_article) do
    create(:learning_article,
           url: 'http://example.com',
           title: 'Some Text',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_learning_article_path(learning_article) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_learning_article_path(learning_article)

      fill_in 'learning_article[url]', with: 'http://example.com/test'
      fill_in 'learning_article[title]', with: 'Article Title'
      select 'good', from: 'learning_article[feeling]'
      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_learning_articles_path' do
      expect(page).to have_current_path(my_learning_articles_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Title' => 'Article Title', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_articles', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit edit_my_learning_article_path(learning_article)

      fill_in 'learning_article[url]', with: ' '

      click_button I18n.t('shared.buttons.save')
    end

    it 'renders errors count' do
      expect(page).to have_text('1 error prohibited this learning article from being saved')
    end
  end
end
