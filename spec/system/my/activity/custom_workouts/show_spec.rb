# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Activity Custom Workout', type: :system do
  let(:account) { create(:account) }
  let(:activity_custom_workout) do
    create(:activity_custom_workout,
           title: 'My <b>Workout</b>',
           notes: 'My <b>Notes</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_activity_custom_workout_path(activity_custom_workout) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_activity_custom_workout_path(activity_custom_workout)
    end

    it 'has title' do
      expect(page.find(:id, 'title')).to have_text('My Workout', exact: true)
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Notes', exact: true)
    end
  end
end
