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
      fill_in 'activity_outdoor_walk[distance]', with: '10,55'
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
      expect(page).to have_text('4 errors prohibited this activity outdoor walk from being saved')
    end

    %i[distance_unit distance steps feeling].each do |key|
      include_examples 'when field is blank', key
    end
  end
end
