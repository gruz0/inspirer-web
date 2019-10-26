# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Learning Video', type: :system do
  let(:account) { create(:account) }
  let(:learning_video) do
    create(:learning_video,
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
      visit edit_my_learning_video_path(learning_video)

      fill_in 'learning_video[url]', with: 'http://example.com/test'
      fill_in 'learning_video[title]', with: 'Video Title'
      select 'good', from: 'learning_video[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_learning_videos_path' do
      expect(page).to have_current_path(my_learning_videos_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Title' => 'Video Title', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_videos', with_rows: rows)
    end
  end
end
