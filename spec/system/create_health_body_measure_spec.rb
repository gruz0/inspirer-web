# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Health Body Measure', type: :system do
  let(:account) { create(:account) }

  before do
    sign_in(account)
  end

  context 'with valid inputs' do
    before do
      visit new_my_health_body_measure_path

      select 'cm', from: 'health_body_measure[unit]'
      fill_in 'health_body_measure[chest]', with: 98.51
      fill_in 'health_body_measure[waist]', with: 75.38
      fill_in 'health_body_measure[hips]', with: 103.27
      select 'good', from: 'health_body_measure[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_health_body_measures_path' do
      expect(page).to have_current_path(my_health_body_measures_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      values = { 'Chest' => '99', 'Waist' => '75', 'Hips' => '103', 'Unit' => 'cm', 'Feeling' => 'good' }

      expect(find('#health_body_measures')).to have_table_row(values)
    end
  end

  context 'with invalid inputs' do
    before do
      visit new_my_health_body_measure_path

      click_button 'Save'
    end

    it 'redirects to my_health_body_measures_path' do
      expect(page).to have_current_path(my_health_body_measures_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('8 errors prohibited this health body measure from being saved')
    end

    it 'renders error message if unit is blank' do
      expect(page).to have_text('Unit can\'t be blank')
    end

    it 'renders error message if chest is blank' do
      expect(page).to have_text('Chest can\'t be blank')
    end

    it 'renders error message if chest is not a number' do
      expect(page).to have_text('Chest is not a number')
    end

    it 'renders error message if waist is blank' do
      expect(page).to have_text('Waist can\'t be blank')
    end

    it 'renders error message if waist is not a number' do
      expect(page).to have_text('Waist is not a number')
    end

    it 'renders error message if hips is blank' do
      expect(page).to have_text('Hips can\'t be blank')
    end

    it 'renders error message if hips is not a number' do
      expect(page).to have_text('Hips is not a number')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('Feeling can\'t be blank')
    end
  end

  context 'when record for this day already exists' do
    before do
      visit new_my_health_body_measure_path

      create(:health_body_measure, account: account)

      click_button 'Save'
    end

    it 'renders error message' do
      expect(page).to have_text('Created date should happen once per day')
    end
  end
end
