# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating an Activity Runnings', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_activity_running_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_running_path

      select 'km', from: 'activity_running[distance_unit]'
      fill_in 'activity_running[distance]', with: '10,55'
      select 'good', from: 'activity_running[feeling]'
      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_activity_runnings_path' do
      expect(page).to have_current_path(my_activity_runnings_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      rows = [{ 'Distance' => '10.5', 'Unit' => 'km', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_runnings', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit new_my_activity_running_path

      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_activity_runnings_path' do
      expect(page).to have_current_path(my_activity_runnings_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('3 errors prohibited this activity running from being saved')
    end

    %i[distance_unit distance feeling].each do |key|
      include_examples 'when field is blank', key
    end
  end
end
