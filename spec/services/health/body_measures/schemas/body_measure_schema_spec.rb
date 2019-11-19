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
        feeling: feeling
      }
    }
  end
  let(:chest) { 90.3 }
  let(:waist) { 61.5 }
  let(:hips) { 92.8 }
  let(:unit) { 'cm' }
  let(:feeling) { 'good' }

  it { is_expected.to be_success }

  it_behaves_like 'it allows to use comma as a delimiter', :chest
  it_behaves_like 'it allows to use comma as a delimiter', :waist
  it_behaves_like 'it allows to use comma as a delimiter', :hips

  it_behaves_like 'it validates unit'

  it_behaves_like 'it validates feeling'
end
