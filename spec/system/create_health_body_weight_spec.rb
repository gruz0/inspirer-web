# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Health Body Weight', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_health_body_weight_path }
  end

  shared_examples 'created successful' do
    before do
      sign_in(account)

      visit new_my_health_body_weight_path

      fill_in 'health_body_weight[weight]', with: weight
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
      rows = [{ 'Weight' => '115.4', 'Unit' => 'kg', 'Feeling' => 'good' }]
      expect(page).to have_table('health_body_weights', with_rows: rows)
    end
  end

  context 'with valid inputs' do
    let(:weight) { 115.423 }

    it_behaves_like 'created successful'
  end

  context 'when weight is a string' do
    let(:weight) { '115.423' }

    it_behaves_like 'created successful'
  end

  context 'when weight uses a comma as a separator' do
    let(:weight) { '115,423' }

    it_behaves_like 'created successful'
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit new_my_health_body_weight_path

      click_button 'Save'
    end

    it 'redirects to my_health_body_weights_path' do
      expect(page).to have_current_path(my_health_body_weights_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('3 errors prohibited this health body weight from being saved')
    end

    it 'renders error message if weight is blank' do
      expect(page).to have_text('weight must be filled')
    end

    it 'renders error message if unit is blank' do
      expect(page).to have_text('unit must be filled')
    end

    it 'renders error message if feeling is blank' do
      expect(page).to have_text('feeling must be filled')
    end
  end

  context 'when weight is not a float' do
    before do
      sign_in(account)

      visit new_my_health_body_weight_path

      fill_in 'health_body_weight[weight]', with: 'abc'
      click_button 'Save'
    end

    it 'renders error message' do
      expect(page).to have_text('weight must be a float')
    end
  end

  context 'when record for this day already exists' do
    before do
      sign_in(account)

      visit new_my_health_body_weight_path

      create(:health_body_weight, account: account)

      fill_in 'health_body_weight[weight]', with: 99.1
      select 'kg', from: 'health_body_weight[unit]'
      select 'good', from: 'health_body_weight[feeling]'

      click_button 'Save'
    end

    it 'renders error message' do
      expect(page).to have_text('Created date should happen once per day')
    end
  end
end
