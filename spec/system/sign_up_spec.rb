# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign Up', type: :system do
  describe 'user successfully signs up' do
    subject(:result) do
      visit new_account_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: 'v3r45tr0n(Pass0rd'
      fill_in 'Password confirmation', with: 'v3r45tr0n(Pass0rd'
      click_button 'Sign up'
    end

    let(:email) { 'me@example.com' }

    it 'creates a new account' do
      expect { result }.to change(Account, :count).by(1)
    end

    it 'redirects to Dashboard' do
      result

      expect(page).to have_current_path(dashboard_index_path)
    end

    it 'renders welcome message' do
      result

      expect(page).to have_text('Welcome! You have signed up successfully.')
    end

    # rubocop:disable RSpec/MultipleExpectations
    it 'sends confirmation mail' do
      result

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to).to eq([email])
      expect(mail.from).to eq(['robot@inspirer.app'])
      expect(mail.subject).to eq('Confirmation instructions')
    end
    # rubocop:enable RSpec/MultipleExpectations
  end

  context 'when the password is too weak' do
    let(:password) { '12345678' }

    before do
      visit new_account_registration_path
      fill_in 'Email', with: 'me@example.com'
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

    context 'with only numbers' do
      it 'renders error message' do
        expect(page).to have_text 'This is a top-10 common password'
      end
    end

    context 'with one special character' do
      let(:password) { '12345678!' }

      it 'renders error message' do
        expect(page).to have_text 'This is similar to a commonly used password'
      end
    end

    context 'with one letter and one special character' do
      let(:password) { '1234567z!' }

      it 'renders error message' do
        expect(page).to have_text 'This is similar to a commonly used password'
      end
    end
  end
end
