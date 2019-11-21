# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyMeasures::Schemas::BodyMeasureSchema do
  subject(:result) { described_class.call(input) }

  let(:input) do
    {
      attributes: {
        chest: chest,
        waist: waist,
        hips: hips,
        unit: unit,
        feeling: feeling,
        notes: notes
      }
    }
  end
  let(:chest) { 90.3 }
  let(:waist) { 61.5 }
  let(:hips) { 92.8 }
  let(:unit) { 'cm' }
  let(:feeling) { 'good' }
  let(:notes) { html_ipsum('My Notes') }

  it { is_expected.to be_success }

  %i[chest waist hips].each { |key| include_examples 'it allows to use comma as a delimiter', key }

  %i[unit feeling].each { |key| include_examples 'it validates enum', key }

  include_examples 'it sanitizes html', :notes
end
