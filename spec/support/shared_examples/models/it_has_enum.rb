# frozen_string_literal: true

RSpec.shared_examples 'it has enum' do |column, values|
  it { is_expected.to validate_presence_of(column) }
  it { is_expected.to define_enum_for(column).with_values(values).backed_by_column_of_type(:enum) }

  it { is_expected.not_to allow_value(nil).for(column) }
  it { is_expected.not_to allow_value('').for(column) }

  it "raises exception for unsupported value of #{column}" do
    expect do
      model.send("#{column}=", 'test')
    end.to raise_exception(ArgumentError, "'test' is not a valid #{column}")
  end
end
