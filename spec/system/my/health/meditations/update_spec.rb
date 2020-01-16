# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating an Health Meditation', type: :system do
  let(:account) { create(:account) }
  let(:health_meditation) do
    create(:health_meditation,
           notes: 'Some Notes',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { edit_my_health_meditation_path(health_meditation) }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit edit_my_health_meditation_path(health_meditation)

      fill_in 'health_meditation[notes]', with: 'New Notes'
      select 'good', from: 'health_meditation[feeling]'
      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_health_meditations_path' do
      expect(page).to have_current_path(my_health_meditations_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully updated')
    end

    it 'renders table with a new record' do
      rows = [{ 'Notes' => 'New Notes', 'Feeling' => 'good' }]
      expect(page).to have_table('health_meditations', with_rows: rows)
    end
  end

  context 'with invalid inputs' do
    before do
      sign_in(account)

      visit edit_my_health_meditation_path(health_meditation)

      fill_in 'health_meditation[notes]', with: ' '

      click_button I18n.t('shared.buttons.save')
    end

    it 'renders errors count' do
      expect(page).to have_text('1 error prohibited this health meditation from being saved')
    end
  end
end
