# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating an Activity Outdoor Walk', type: :system do
  let(:account) { create(:account) }
  let(:activity_outdoor_walk) do
    create(:activity_outdoor_walk,
           distance_unit: 'mi',
           distance: 10.9,
           steps: 13_351,
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_activity_outdoor_walk_path(activity_outdoor_walk) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_activity_outdoor_walk_path(activity_outdoor_walk)

      select 'km', from: 'activity_outdoor_walk[distance_unit]'
      fill_in 'activity_outdoor_walk[distance]', with: 14.3
      fill_in 'activity_outdoor_walk[steps]', with: 15_901
      select 'good', from: 'activity_outdoor_walk[feeling]'
      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_activity_outdoor_walks_path' do
      expect(page).to have_current_path(my_activity_outdoor_walks_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Distance' => '14.3', 'Unit' => 'km', 'Steps' => '15901', 'Feeling' => 'good' }]
      expect(page).to have_table('activity_outdoor_walks', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit edit_my_activity_outdoor_walk_path(activity_outdoor_walk)

      fill_in 'activity_outdoor_walk[distance]', with: ' '
      fill_in 'activity_outdoor_walk[steps]', with: ' '

      click_button I18n.t('shared.buttons.save')
    end

    it 'renders errors count' do
      expect(page).to have_text('2 errors prohibited this activity outdoor walk from being saved')
    end
  end
end
