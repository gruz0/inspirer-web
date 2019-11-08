# frozen_string_literal: true

RSpec.shared_examples 'unauthorized' do
  before { visit path }

  it 'renders error message' do
    expect(page).to have_text('You need to sign in or sign up before continuing.')
  end
end
