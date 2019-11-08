# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating an Activity Yoga Asana', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_activity_yoga_asana_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_yoga_asana_path

      fill_in 'activity_yoga_asana[notes]', with: 'Some notes'
      select 'good', from: 'activity_yoga_asana[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_activity_yoga_asanas_path' do
      expect(page).to have_current_path(my_activity_yoga_asanas_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      rows = [{ 'Notes' => 'Some notes', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_yoga_asanas', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_yoga_asana_path

      click_button 'Save'
    end

    it 'redirects to my_activity_yoga_asanas_path' do
      expect(page).to have_current_path(my_activity_yoga_asanas_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('2 errors prohibited this activity yoga asana from being saved')
    end

    it 'renders error message if notes is blank' do
      expect(page).to have_text('Notes can\'t be blank')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('Feeling can\'t be blank')
    end
  end
end
