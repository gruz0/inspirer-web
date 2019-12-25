# frozen_string_literal: true

RSpec.shared_examples 'it validates url_format' do
  describe 'rules' do
    describe 'url_format' do
      ['invalid', 'example.com', 'ftp://domain.tld'].each do |invalid_url|
        before { input[:attributes][:url] = invalid_url }

        it { is_expected.to be_failure }

        it 'has error' do
          expect(errors[:attributes][:url]).to eq(['not a valid URL format'])
        end
      end
    end
  end
end
