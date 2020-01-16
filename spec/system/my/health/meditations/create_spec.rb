# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating an Health Meditation', type: :system do
  let(:account) { create(:account) }

  it_behaves_like 'unauthorized' do
    let(:path) { new_my_health_meditation_path }
  end

  context 'with valid inputs' do
    before do
      sign_in(account)

      visit new_my_health_meditation_path

      fill_in 'health_meditation[notes]', with: 'Some notes'
      select 'good', from: 'health_meditation[feeling]'
      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_health_meditations_path' do
      expect(page).to have_current_path(my_health_meditations_path)
    end

    it 'renders confirmation message' do
      expect(page).to have_text('Record was successfully created')
    end

    it 'renders table with a new record' do
      rows = [{ 'Notes' => 'Some notes', 'Feeling' => 'good' }]
      expect(page).to have_table('health_meditations', with_rows: rows)
    end
  end

  context 'with empty inputs' do
    before do
      sign_in(account)

      visit new_my_health_meditation_path

      click_button I18n.t('shared.buttons.save')
    end

    it 'redirects to my_health_meditations_path' do
      expect(page).to have_current_path(my_health_meditations_path)
    end

    it 'renders errors count' do
      expect(page).to have_text('2 errors prohibited this health meditation from being saved')
    end
  end
end
