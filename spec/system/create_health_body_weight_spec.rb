# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Health Body Weight', type: :system do
  let(:account) { create(:account) }

  before do
    sign_in(account)
  end

  context 'with valid inputs' do
    before do
      visit new_my_health_body_weight_path

      fill_in 'health_body_weight[weight]', with: 115.423
      select 'kg', from: 'health_body_weight[unit]'
      select 'good', from: 'health_body_weight[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_health_body_weights_path' do
      expect(page).to have_current_path(my_health_body_weights_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      values = { 'Weight' => '115.4', 'Unit' => 'kg', 'Feeling' => 'good' }

      expect(find('#health_body_weights')).to have_table_row(values)
    end
  end

  context 'with invalid inputs' do
    before do
      visit new_my_health_body_weight_path

      click_button 'Save'
    end

    it 'redirects to my_health_body_weights_path' do
      expect(page).to have_current_path(my_health_body_weights_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('4 errors prohibited this health body weight from being saved')
    end

    it 'renders error message if weight is blank' do
      expect(page).to have_text('Weight can\'t be blank')
    end

    it 'renders error message if weight is not a number' do
      expect(page).to have_text('Weight is not a number')
    end

    it 'renders error message if unit is blank' do
      expect(page).to have_text('Unit can\'t be blank')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('Feeling can\'t be blank')
    end
  end

  context 'when record for this day already exists' do
    before do
      visit new_my_health_body_weight_path

      create(:health_body_weight, account: account)

      click_button 'Save'
    end

    it 'renders error message' do
      expect(page).to have_text('Created date should happen once per day')
    end
  end
end
