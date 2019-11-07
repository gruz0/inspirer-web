# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Learning Video', type: :system do
  let(:account) { create(:account) }

  before do
    sign_in(account)
  end

  context 'with valid inputs' do
    before do
      visit new_my_learning_video_path

      fill_in 'learning_video[url]', with: 'http://example.com/test'
      fill_in 'learning_video[title]', with: 'Some text'
      select 'good', from: 'learning_video[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_learning_videos_path' do
      expect(page).to have_current_path(my_learning_videos_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      # FIXME: It should be replaced with link matcher
      rows = [{ 'Title' => 'Some text', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_videos', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      visit new_my_learning_video_path

      click_button 'Save'
    end

    it 'redirects to my_learning_videos_path' do
      expect(page).to have_current_path(my_learning_videos_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('3 errors prohibited this learning video from being saved')
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
      video = create(:learning_video, account: account)

      visit new_my_learning_video_path

      fill_in 'learning_video[url]', with: video.url
      fill_in 'learning_video[title]', with: 'Some text'
      select 'good', from: 'learning_video[feeling]'
      click_button 'Save'
    end

    it 'renders error message' do
      expect(page).to have_text('Url has already been taken')
    end
  end

  it_behaves_like 'value is too long', 'learning_video', 'title', 'Title' do
    let(:path) { new_my_learning_video_path }
  end
end
