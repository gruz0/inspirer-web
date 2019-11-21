# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Health Sleep', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_health_sleep_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_health_sleep_path

      select '02', from: 'health_sleep[woke_up_at_hour]'
      select '35', from: 'health_sleep[woke_up_at_minutes]'
      select 'good', from: 'health_sleep[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_health_sleeps_path' do
      expect(page).to have_current_path(my_health_sleeps_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      rows = [{ 'I woke up at' => '02:35', 'Feeling' => 'good' }]
      expect(page).to have_table('health_sleeps', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit new_my_health_sleep_path

      click_button 'Save'
    end

    it 'redirects to my_health_sleeps_path' do
      expect(page).to have_current_path(my_health_sleeps_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('3 errors prohibited this health sleep from being saved')
    end

    %i[woke_up_at_hour woke_up_at_minutes feeling].each do |key|
      include_examples 'when field is blank', key
    end
  end
end
