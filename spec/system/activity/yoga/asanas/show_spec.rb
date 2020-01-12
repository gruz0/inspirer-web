# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Activity Yoga Asana', type: :system do
  let(:account) { create(:account) }
  let(:activity_yoga_asana) do
    create(:activity_yoga_asana,
           notes: 'My <b>Asana</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_activity_yoga_asana_path(activity_yoga_asana) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_activity_yoga_asana_path(activity_yoga_asana)
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Asana', exact: true)
    end
  end
end
