# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Activity Outdoor Walk', type: :system do
  let(:account) { create(:account) }
  let(:activity_outdoor_walk) do
    create(:activity_outdoor_walk,
           distance_unit: :km,
           distance: 5.9,
           steps: 6_991,
           notes: 'My <b>Notes</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_activity_outdoor_walk_path(activity_outdoor_walk) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_activity_outdoor_walk_path(activity_outdoor_walk)
    end

    it 'has distance' do
      expect(page).to have_text('5.9')
    end

    it 'has steps' do
      expect(page).to have_text('6991')
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Notes', exact: true)
    end
  end
end
