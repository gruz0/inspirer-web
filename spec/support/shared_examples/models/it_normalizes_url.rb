# frozen_string_literal: true

RSpec.shared_examples 'it normalizes url' do
  describe '#normalize_url' do
    it 'returns url without spaces' do
      model.url = '  http://example.com    '
      model.validate

      expect(model.url).to eq('http://example.com')
    end

    it 'returns non-downcased url' do
      model.url = 'https://www.youtube.com/watch?v=jTNDhogZKQA&feature=youtu.be'
      model.validate

      expect(model.url).to eq('https://www.youtube.com/watch?v=jTNDhogZKQA&feature=youtu.be')
    end
  end
end
