# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Redirects to #edit if record for this day already exists', type: :system do
  let(:account) { create(:account) }

  describe 'Health > Sleep' do
    let(:health_sleep) { create(:health_sleep, account: account) }

    before do
      sign_in(account)

      health_sleep

      visit my_health_sleeps_path

      click_link 'Track Today'
    end

    it 'redirects to #edit' do
      expect(page).to have_current_path(edit_my_health_sleep_path(health_sleep))
    end
  end

  describe 'Health > Body Weight' do
    let(:health_body_weight) { create(:health_body_weight, account: account) }

    before do
      sign_in(account)

      health_body_weight

      visit my_health_body_weights_path

      click_link 'Track Today'
    end

    it 'redirects to #edit' do
      expect(page).to have_current_path(edit_my_health_body_weight_path(health_body_weight))
    end
  end

  describe 'Health > Body Measure' do
    let(:health_body_measure) { create(:health_body_measure, account: account) }

    before do
      sign_in(account)

      health_body_measure

      visit my_health_body_measures_path

      click_link 'Track Today'
    end

    it 'redirects to #edit' do
      expect(page).to have_current_path(edit_my_health_body_measure_path(health_body_measure))
    end
  end

  describe 'Activity > Outdoor Walk' do
    let(:activity_outdoor_walk) { create(:activity_outdoor_walk, account: account) }

    before do
      sign_in(account)

      activity_outdoor_walk

      visit my_activity_outdoor_walks_path

      click_link 'Track Today'
    end

    it 'redirects to #edit' do
      expect(page).to have_current_path(edit_my_activity_outdoor_walk_path(activity_outdoor_walk))
    end
  end
end
