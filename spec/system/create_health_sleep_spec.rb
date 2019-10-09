# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Health Sleep', type: :system do
  let(:account) { create(:account) }

  before do
    sign_in(account)
  end

  context 'with valid inputs' do
    before do
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
      values = {
        'I woke up at' => '02:35',
        'Feeling' => 'good'
      }

      expect(find('#health_sleeps')).to have_table_row(values)
    end
  end

  context 'with invalid inputs' do
    before do
      visit new_my_health_sleep_path

      click_button 'Save'
    end

    it 'redirects to my_health_sleeps_path' do
      expect(page).to have_current_path(my_health_sleeps_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('4 errors prohibited this health sleep from being saved')
    end

    it 'renders error message if woke_up_at_hour is blank' do
      expect(page).to have_text('Woke up at hour can\'t be blank')
    end

    it 'renders error message if woke_up_at_hour is not a number' do
      expect(page).to have_text('Woke up at hour is not a number')
    end

    it 'renders error message if woke_up_at_minutes is blank' do
      expect(page).to have_text('Woke up at minutes can\'t be blank')
    end

    it 'renders error message if woke_up_at_minutes is not a number' do
      expect(page).to have_text('Woke up at minutes is not a number')
    end
  end
end
