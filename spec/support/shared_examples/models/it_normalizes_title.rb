# frozen_string_literal: true

RSpec.shared_examples 'it normalizes title' do
  describe '#normalize_title' do
    it 'returns value without spaces and newline symbols' do
      model.title = "\n  БС119: Сознание есть? А если найду?\n  Личная эффективность |   Продуктивность\n \n"
      model.validate

      expect(model.title).to eq('БС119: Сознание есть? А если найду? Личная эффективность | Продуктивность')
    end
  end
end
