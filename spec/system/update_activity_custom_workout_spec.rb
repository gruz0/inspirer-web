# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating an Activity Custom Workout', type: :system do
  let(:account) { create(:account) }
  let(:activity_custom_workout) do
    create(:activity_custom_workout,
           title: 'Pushups',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_activity_custom_workout_path(activity_custom_workout) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_activity_custom_workout_path(activity_custom_workout)

      fill_in 'activity_custom_workout[title]', with: 'Pull-ups'
      select 'good', from: 'activity_custom_workout[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_activity_custom_workouts_path' do
      expect(page).to have_current_path(my_activity_custom_workouts_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Title' => 'Pull-ups', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_custom_workouts', with_rows: rows)
    end
  end
end
