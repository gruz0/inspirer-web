# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating an Activity Yoga Asana', type: :system do
  let(:account) { create(:account) }
  let(:activity_yoga_asana) do
    create(:activity_yoga_asana,
           notes: 'Some Notes',
           feeling: 'amazing',
           account: account)
  end

  before do
    sign_in(account)
  end

  context 'with valid inputs' do
    before do
      visit edit_my_activity_yoga_asana_path(activity_yoga_asana)

      fill_in 'activity_yoga_asana[notes]', with: 'New Notes'
      select 'good', from: 'activity_yoga_asana[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_activity_yoga_asanas_path' do
      expect(page).to have_current_path(my_activity_yoga_asanas_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Notes' => 'New Notes', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_yoga_asanas', with_rows: rows)
    end
  end
end
