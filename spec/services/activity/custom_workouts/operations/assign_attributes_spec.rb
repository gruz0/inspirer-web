# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Activity::CustomWorkouts::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:activity_custom_workout) { account.activity_custom_workout.new }

  let(:input) do
    {
      resource: activity_custom_workout,
      attributes: {
        title: ' My Workout ',
        feeling: 'good',
        notes: html_ipsum('My Notes')
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns title' do
    expect(resource.title).to eq('My Workout')
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(resource.notes).to eq('My Notes')
  end
end
