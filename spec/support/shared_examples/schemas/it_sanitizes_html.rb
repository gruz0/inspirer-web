# frozen_string_literal: true

RSpec.shared_examples 'it sanitizes html' do |key|
  let(key) { html_ipsum('My Content') }

  it 'returns text without HTML' do
    expect(result[:attributes][key]).to eq('My Content')
  end
end
