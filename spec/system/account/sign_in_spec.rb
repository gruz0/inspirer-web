# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign In', type: :system do
  let(:account) { create(:account) }

  context 'with valid credentials' do
    it 'redirects to Dashboard' do
      sign_in_as(account)

      expect(page).to have_current_path(dashboard_index_path)
    end

    it 'renders sign in confirmation text' do
      sign_in_as(account)

      expect(page).to have_text 'Signed in successfully'
    end
  end

  context 'with invalid credentials' do
    before do
      visit root_path
      click_link 'Log In'
      fill_in 'Email', with: account.email
      fill_in 'Password', with: 'invalid'
      click_button I18n.t('shared.buttons.log_in')
    end

    it 'redirects to login page' do
      expect(page).to have_current_path(account_session_path)
    end

    it 'renders error message' do
      expect(page).to have_text 'Invalid Email or password'
    end
  end
end
