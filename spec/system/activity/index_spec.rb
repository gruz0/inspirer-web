# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the index view of Activity section', type: :system do
  it_behaves_like 'unauthorized' do
    let(:path) { my_activity_index_path }
  end

  context 'with authorized access' do
    let(:account) { create(:account) }

    before do
      sign_in(account)

      visit my_activity_index_path
    end

    it 'has 7 cards' do
      expect(page.find('main')).to have_selector('.card', count: 7)
    end

    it 'has link to Gym & Workout' do
      expect(page).to have_link(nil, href: my_activity_gym_index_path, text: 'Gym & Workout')
    end

    it 'has link to Running' do
      expect(page).to have_link(nil, href: my_activity_runnings_path, text: 'Running')
    end

    it 'has link to Outdoor Walks' do
      expect(page).to have_link(nil, href: my_activity_outdoor_walks_path, text: 'Outdoor Walks')
    end

    it 'has link to Cycling' do
      expect(page).to have_link(nil, href: my_activity_cycling_index_path, text: 'Cycling')
    end

    it 'has link to Yoga' do
      expect(page).to have_link(nil, href: my_activity_yoga_index_path, text: 'Yoga')
    end

    it 'has link to Stretching' do
      expect(page).to have_link(nil, href: my_activity_stretching_index_path, text: 'Stretching')
    end

    it 'has link to Custom Workout' do
      expect(page).to have_link(nil, href: my_activity_custom_workouts_path, text: 'Custom Workout')
    end
  end
end
