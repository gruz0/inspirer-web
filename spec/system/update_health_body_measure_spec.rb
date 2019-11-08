# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Health Body Measure', type: :system do
  let(:account) { create(:account) }
  let(:health_body_measure) do
    create(:health_body_measure,
           unit: 'inch',
           chest: 90.15,
           waist: 68.83,
           hips: 98.5,
           feeling: 'good',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_health_body_measure_path(health_body_measure) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_health_body_measure_path(health_body_measure)

      select 'cm', from: 'health_body_measure[unit]'
      fill_in 'health_body_measure[chest]', with: 95.73
      fill_in 'health_body_measure[waist]', with: 69.8
      fill_in 'health_body_measure[hips]', with: 100.51
      select 'amazing', from: 'health_body_measure[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_health_body_measures_path' do
      expect(page).to have_current_path(my_health_body_measures_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Chest' => '95.7', 'Waist' => '69.8', 'Hips' => '100.5', 'Unit' => 'cm', 'Feeling' => 'amazing' }]
      expect(page).to have_table('health_body_measures', with_rows: rows)
    end
  end
end
