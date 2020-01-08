# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating an Activity Running', type: :system do
  let(:account) { create(:account) }
  let(:activity_running) do
    create(:activity_running,
           distance_unit: 'mi',
           distance: 10.9,
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_activity_running_path(activity_running) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_activity_running_path(activity_running)

      select 'km', from: 'activity_running[distance_unit]'
      fill_in 'activity_running[distance]', with: 14.3
      select 'good', from: 'activity_running[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_activity_runnings_path' do
      expect(page).to have_current_path(my_activity_runnings_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Distance' => '14.3', 'Unit' => 'km', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_runnings', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit edit_my_activity_running_path(activity_running)

      fill_in 'activity_running[distance]', with: ' '

      click_button 'Save'
    end

    it 'renders errors count' do
      expect(page).to have_text('1 error prohibited this activity running from being saved')
    end
  end
end
