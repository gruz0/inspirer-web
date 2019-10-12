# frozen_string_literal: true

RSpec.shared_examples 'it sanitizes notes' do
  it { is_expected.to callback(:sanitize_notes).before(:validation) }

  it 'removes HTML tags' do
    model.notes = '<a href="#">test</a>Text<script>alert("qwe");</script>'
    model.validate
    expect(model.notes).to eq('Text')
  end
end
