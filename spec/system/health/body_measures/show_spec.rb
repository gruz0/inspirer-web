# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Health Body Measure', type: :system do
  let(:account) { create(:account) }
  let(:health_body_measure) do
    create(:health_body_measure,
           chest: '99.1',
           waist: '64.4',
           hips: '98.8',
           unit: :cm,
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_health_body_measure_path(health_body_measure) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_health_body_measure_path(health_body_measure)
    end

    it 'has chest' do
      expect(page).to have_text('99.1')
    end

    it 'has waist' do
      expect(page).to have_text('64.4')
    end

    it 'has hips' do
      expect(page).to have_text('98.8')
    end
  end
end
