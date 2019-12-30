# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating a Health Sleep', type: :system do
  let(:account) { create(:account) }
  let(:health_sleep) do
    create(:health_sleep,
           woke_up_at_hour: 10,
           woke_up_at_minutes: 35,
           feeling: 'good',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_health_sleep_path(health_sleep) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_health_sleep_path(health_sleep)

      select '15', from: 'health_sleep[woke_up_at_hour]'
      select '59', from: 'health_sleep[woke_up_at_minutes]'
      select 'amazing', from: 'health_sleep[feeling]'
      click_button 'Save'
    end

    it 'redirects to my_health_sleeps_path' do
      expect(page).to have_current_path(my_health_sleeps_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'I woke up at' => '15:59', 'Feeling' => 'amazing' }]
      expect(page).to have_table('health_sleeps', with_rows: rows)
    end
  end

  # FIXME: It is not possible to test this case because of not enough text fields
  xcontext 'with invalid inputs'
end
