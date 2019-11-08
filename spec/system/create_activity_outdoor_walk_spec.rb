# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating an Activity Outdoor Walk', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_activity_outdoor_walk_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_outdoor_walk_path

      select 'km', from: 'activity_outdoor_walk[distance_unit]'
      fill_in 'activity_outdoor_walk[distance]', with: 10.5
      fill_in 'activity_outdoor_walk[steps]', with: 13_500
      select 'good', from: 'activity_outdoor_walk[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_activity_outdoor_walks_path' do
      expect(page).to have_current_path(my_activity_outdoor_walks_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      rows = [{ 'Distance' => '10.5', 'Unit' => 'km', 'Steps' => '13500', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_outdoor_walks', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_outdoor_walk_path

      click_button 'Save'
    end

    it 'redirects to my_activity_outdoor_walks_path' do
      expect(page).to have_current_path(my_activity_outdoor_walks_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('6 errors prohibited this activity outdoor walk from being saved')
    end

    it 'renders error message if distance_unit is blank' do
      expect(page).to have_text('Distance unit can\'t be blank')
    end

    it 'renders error message if distance is blank' do
      expect(page).to have_text('Distance can\'t be blank')
    end

    it 'renders error message if distance is not a number' do
      expect(page).to have_text('Distance is not a number')
    end

    it 'renders error message if steps is blank' do
      expect(page).to have_text('Steps can\'t be blank')
    end

    it 'renders error message if steps is not a number' do
      expect(page).to have_text('Steps is not a number')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('Feeling can\'t be blank')
    end
  end

  context 'when record for this day already exists' do
    before do
      sign_in(account)

      visit new_my_activity_outdoor_walk_path

      create(:activity_outdoor_walk, account: account)

      click_button 'Save'
    end

    it 'renders error message' do
      expect(page).to have_text('Created date should happen once per day')
    end
  end
end
