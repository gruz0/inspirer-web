# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Health Body Weight', type: :system do
  let(:account) { create(:account) }
  let(:health_body_weight) do
    create(:health_body_weight,
           weight: 98.315,
           unit: 'kg',
           feeling: 'good',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_health_body_weight_path(health_body_weight) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_health_body_weight_path(health_body_weight)

      fill_in 'health_body_weight[weight]', with: 103.267
      select 'lbs', from: 'health_body_weight[unit]'
      select 'amazing', from: 'health_body_weight[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_health_body_weights_path' do
      expect(page).to have_current_path(my_health_body_weights_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Weight' => '103.2', 'Unit' => 'lbs', 'Feeling' => 'amazing' }]
      expect(page).to have_table('health_body_weights', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit edit_my_health_body_weight_path(health_body_weight)

      fill_in 'health_body_weight[weight]', with: ' '

      click_button 'Save'
    end

    it 'renders errors count' do
      expect(page).to have_text('1 error prohibited this health body weight from being saved')
    end
  end
end
