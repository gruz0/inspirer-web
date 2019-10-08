# frozen_string_literal: true

module LoginSupport
  def sign_in_as(account)
    visit root_path
    click_link 'Log In'
    fill_in 'Email', with: account.email
    fill_in 'Password', with: account.password
    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
