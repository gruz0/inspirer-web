# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reset Password', type: :system do
  context 'when user does not exist' do
    before do
      visit new_account_password_path

      fill_in 'Email', with: 'some@example.com'

      click_button 'Send me reset password instructions'
    end

    it 'renders error message' do
      expect(page).to have_text 'If your email address exists in our database, ' \
                                'you will receive a password recovery link at your email address in a few minutes.'
    end
  end
end
