# frozen_string_literal: true

RSpec.shared_examples 'it sanitizes notes' do
  it { is_expected.to callback(:sanitize_notes).before(:validation) }

  it 'removes HTML tags' do
    model.notes = html_ipsum('Text')
    model.validate
    expect(model.notes).to eq('Text')
  end
end
