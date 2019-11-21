# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::Schemas::BodyWeightSchema do
  subject(:result) { described_class.call(input) }

  let(:input) do
    {
      attributes: {
        weight: weight,
        unit: unit,
        feeling: feeling,
        notes: notes
      }
    }
  end
  let(:weight) { 123.45 }
  let(:unit) { 'kg' }
  let(:feeling) { 'good' }
  let(:notes) { html_ipsum('My Notes') }

  it { is_expected.to be_success }

  include_examples 'it allows to use comma as a delimiter', :weight

  %i[unit feeling].each { |key| include_examples 'it validates enum', key }

  include_examples 'it sanitizes html', :notes
end
