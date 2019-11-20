# frozen_string_literal: true

RSpec.shared_examples 'when field is blank' do |key|
  it 'renders error' do
    expect(page).to have_text("#{key} must be filled")
  end
end
