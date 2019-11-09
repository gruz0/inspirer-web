# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating an Activity Custom Workout', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_activity_custom_workout_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_custom_workout_path

      fill_in 'activity_custom_workout[title]', with: 'Pushups'
      fill_in 'activity_custom_workout[notes]', with: '15, 15, 15, 10, 8'
      select 'good', from: 'activity_custom_workout[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_activity_custom_workouts_path' do
      expect(page).to have_current_path(my_activity_custom_workouts_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      rows = [{ 'Title' => 'Pushups', 'Notes' => '15, 15, 15, 10, 8', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_custom_workouts', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_custom_workout_path

      click_button 'Save'
    end

    it 'redirects to my_activity_custom_workouts_path' do
      expect(page).to have_current_path(my_activity_custom_workouts_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('2 errors prohibited this activity custom workout from being saved')
    end

    it 'renders error message if title is blank' do
      expect(page).to have_text('Title can\'t be blank')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('Feeling can\'t be blank')
    end
  end

  it_behaves_like 'value is too long', 'activity_custom_workout', 'title', 'Title' do
    let(:path) { new_my_activity_custom_workout_path }
  end
end
