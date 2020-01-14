# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  subject(:model) { build_stubbed(:account) }

  # Relations
  it { is_expected.to have_many(:health_sleep).dependent(:destroy) }
  it { is_expected.to have_many(:health_body_weight).dependent(:destroy) }
  it { is_expected.to have_many(:health_body_measure).dependent(:destroy) }
  it { is_expected.to have_many(:health_meditation).dependent(:destroy) }
  it { is_expected.to have_many(:activity_outdoor_walk).dependent(:destroy) }
  it { is_expected.to have_many(:activity_running).dependent(:destroy) }
  it { is_expected.to have_many(:activity_yoga_asana).dependent(:destroy) }
  it { is_expected.to have_many(:activity_custom_workout).dependent(:destroy) }
  it { is_expected.to have_many(:learning_article).dependent(:destroy) }
  it { is_expected.to have_many(:learning_podcast).dependent(:destroy) }
  it { is_expected.to have_many(:learning_video).dependent(:destroy) }
  it { is_expected.to have_many(:learning_book).dependent(:destroy) }

  # Website
  it { is_expected.to allow_value(nil).for(:website) }
  it { is_expected.to allow_value('https://example.com/?page=123').for(:website) }
  it { is_expected.not_to allow_value('example.com').for(:website) }

  describe 'callbacks' do
    it { is_expected.to callback(:sanitize_username).before(:validation) }
    it { is_expected.to callback(:sanitize_name).before(:validation) }
    it { is_expected.to callback(:sanitize_bio).before(:validation) }
  end

  describe 'sanitizers' do
    describe '#sanitize_username' do
      it 'removes HTML tags' do
        model.username = html_ipsum('heisenberg')
        model.validate
        expect(model.username).to eq('heisenberg')
      end
    end

    describe '#sanitize_name' do
      it 'removes HTML tags' do
        model.name = html_ipsum('Walter White')
        model.validate
        expect(model.name).to eq('Walter White')
      end
    end

    describe '#sanitize_bio' do
      it 'removes HTML tags' do
        model.bio = html_ipsum('School Teacher')
        model.validate
        expect(model.bio).to eq('School Teacher')
      end
    end
  end

  describe 'validations' do
    describe '#website' do
      it 'is valid if website is a valid url' do
        expect(model).to be_valid
      end

      it 'is valid if website is not set' do
        model.website = nil
        expect(model).to be_valid
      end

      it 'is invalid if website is not a valid url' do
        model.website = 'invalid'
        expect(model).to be_invalid
      end
    end
  end
end
