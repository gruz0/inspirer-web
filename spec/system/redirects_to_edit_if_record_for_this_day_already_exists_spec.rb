# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Redirects to #edit if record for this day already exists', type: :system do
  let(:account) { create(:account) }

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
end
