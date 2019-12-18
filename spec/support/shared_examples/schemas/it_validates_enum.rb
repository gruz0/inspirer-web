# frozen_string_literal: true

RSpec.shared_examples 'it validates enum' do |key, enum|
  context 'when value is in array' do
    enum.keys.map(&:to_s).each do |valid_key|
      let(key) { valid_key }

      it { is_expected.to be_success }
    end
  end

  context 'when enum has invalid value' do
    let(key) { 'unknown' }

    it { is_expected.to be_failure }
  end
end
