# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Activity Running', type: :system do
  let(:account) { create(:account) }
  let(:activity_running) do
    create(:activity_running,
           distance_unit: :km,
           distance: 5.9,
           notes: 'My <b>Notes</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_activity_running_path(activity_running) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_activity_running_path(activity_running)
    end

    it 'has distance' do
      expect(page).to have_text('5.9')
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Notes', exact: true)
    end
  end
end
