# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  subject(:model) { build_stubbed(:account) }

  describe 'callbacks' do
    it { is_expected.to callback(:sanitize_username).before(:validation) }
    it { is_expected.to callback(:sanitize_name).before(:validation) }
    it { is_expected.to callback(:sanitize_bio).before(:validation) }
  end

  describe 'sanitizers' do
    describe '#sanitize_username' do
      it 'removes HTML tags' do
        model.username = '<a href="#">test</a>heisenberg<script>alert("qwe");</script>'
        model.validate
        expect(model.username).to eq('heisenberg')
      end
    end

    describe '#sanitize_name' do
      it 'removes HTML tags' do
        model.name = '<a href="#">test</a>Walter White<script>alert("qwe");</script>'
        model.validate
        expect(model.name).to eq('Walter White')
      end
    end

    describe '#sanitize_bio' do
      it 'removes HTML tags' do
        model.bio = '<a href="#">test</a>School Teacher<script>alert("qwe");</script>'
        model.validate
        expect(model.bio).to eq('School Teacher')
      end
    end
  end
end
