# frozen_string_literal: true

RSpec.shared_examples 'it validates created_date' do
  context 'when have another record for this day' do
    before do
      symbolized_class = described_class.to_s.underscore.to_sym
      model.account = create(symbolized_class).account
      model.validate
    end

    it 'is invalid' do
      expect(model).to be_invalid
    end

    it 'has error' do
      expect(model.errors.messages[:created_date]).to include('should happen once per day')
    end
  end
end
