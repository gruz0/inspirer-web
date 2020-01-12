# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Health Sleep', type: :system do
  let(:account) { create(:account) }
  let(:health_sleep) do
    create(:health_sleep,
           woke_up_at_hour: 3,
           woke_up_at_minutes: 43,
           notes: 'My <b>Notes</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_health_sleep_path(health_sleep) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_health_sleep_path(health_sleep)
    end

    it 'has woke up values' do
      expect(page).to have_text('03:43')
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Notes', exact: true)
    end
  end
end
