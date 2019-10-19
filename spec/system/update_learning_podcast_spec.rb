# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Learning Podcast', type: :system do
  let(:account) { create(:account) }
  let(:learning_podcast) do
    create(:learning_podcast,
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
      visit edit_my_learning_podcast_path(learning_podcast)

      fill_in 'learning_podcast[url]', with: 'http://example.com/test'
      fill_in 'learning_podcast[title]', with: 'Podcast Title'
      select 'good', from: 'learning_podcast[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_learning_podcasts_path' do
      expect(page).to have_current_path(my_learning_podcasts_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Title' => 'Podcast Title', 'Feeling' => 'good' }]
      expect(page).to have_table('learning_podcasts', with_rows: rows)
    end
  end
end
