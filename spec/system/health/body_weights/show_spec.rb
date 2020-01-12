# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Health Body Weight', type: :system do
  let(:account) { create(:account) }
  let(:health_body_weight) do
    create(:health_body_weight,
           weight: '99.1',
           unit: :kg,
           notes: 'My <b>Notes</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_health_body_weight_path(health_body_weight) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_health_body_weight_path(health_body_weight)
    end

    it 'has weight' do
      expect(page).to have_text('99.1')
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Notes', exact: true)
    end
  end
end
