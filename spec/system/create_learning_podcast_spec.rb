# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Learning Podcast', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_learning_podcast_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_learning_podcast_path

      fill_in 'learning_podcast[url]', with: 'http://example.com/test'
      fill_in 'learning_podcast[title]', with: 'Some text'
      select 'good', from: 'learning_podcast[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_learning_podcasts_path' do
      expect(page).to have_current_path(my_learning_podcasts_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      # FIXME: It should be replaced with link matcher
      rows = [{ 'Title' => 'Some text', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_podcasts', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit new_my_learning_podcast_path

      click_button 'Save'
    end

    it 'redirects to my_learning_podcasts_path' do
      expect(page).to have_current_path(my_learning_podcasts_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('3 errors prohibited this learning podcast from being saved')
    end

    it 'renders error message if url is blank' do
      expect(page).to have_text('Url can\'t be blank')
    end

    it 'renders error message if url is not valid' do
      expect(page).to have_text('Url is not a valid URL')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('Feeling can\'t be blank')
    end
  end

  context 'when url is not unique' do
    before do
      sign_in(account)

      podcast = create(:learning_podcast, account: account)

      visit new_my_learning_podcast_path

      fill_in 'learning_podcast[url]', with: podcast.url
      fill_in 'learning_podcast[title]', with: 'Some text'
      select 'good', from: 'learning_podcast[feeling]'
      click_button 'Save'
    end

    it 'renders error message' do
      expect(page).to have_text('Url has already been taken')
    end
  end

  it_behaves_like 'value is too long', 'learning_podcast', 'title', 'Title' do
    let(:path) { new_my_learning_podcast_path }
  end
end
