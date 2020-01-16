# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Health Meditation', type: :system do
  let(:account) { create(:account) }
  let(:health_meditation) do
    create(:health_meditation,
           notes: 'My <b>Meditation</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_health_meditation_path(health_meditation) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_health_meditation_path(health_meditation)
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Meditation', exact: true)
    end
  end
end
