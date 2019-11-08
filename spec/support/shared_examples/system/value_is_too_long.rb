# frozen_string_literal: true

RSpec.shared_examples 'value is too long' do |form_name, field, label, length = 100|
  before do
    sign_in(account)

    visit path

    fill_in "#{form_name}[#{field}]", with: FFaker::Lorem.paragraph
    click_button I18n.t('shared.buttons.save')
  end

  it 'renders error message' do
    expect(page).to have_text("#{label} is too long (maximum is #{length} characters)")
  end
end
