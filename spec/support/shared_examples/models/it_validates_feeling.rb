# frozen_string_literal: true

RSpec.shared_examples 'it validates feeling' do
  it { is_expected.to validate_presence_of(:feeling) }
  it { is_expected.to define_enum_for(:feeling).with_values(FEELINGS).backed_by_column_of_type(:enum) }

  it { is_expected.not_to allow_value(nil).for(:feeling) }
  it { is_expected.not_to allow_value('').for(:feeling) }

  it 'raises exception for unsupported value of feeling' do
    expect do
      model.feeling = 'test'
    end.to raise_exception(ArgumentError, "'test' is not a valid feeling")
  end
end
