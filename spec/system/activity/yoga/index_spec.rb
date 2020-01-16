# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the index view of Activity > Yoga section', type: :system do
  it_behaves_like 'unauthorized' do
    let(:path) { my_activity_yoga_index_path }
  end

  context 'with authorized access' do
    let(:account) { create(:account) }

    before do
      sign_in(account)

      visit my_activity_yoga_index_path
    end

    it 'has 4 cards' do
      expect(page.find('main')).to have_selector('.card', count: 4)
    end

    it 'has link to Asanas' do
      expect(page).to have_link(nil, href: my_activity_yoga_asanas_path, text: 'Asanas')
    end

    it 'has link to Pranayamas' do
      expect(page).to have_link(nil, href: my_activity_yoga_pranayama_index_path, text: 'Pranayamas')
    end

    it 'has link to Uddiyanas' do
      expect(page).to have_link(nil, href: my_activity_yoga_uddiyana_index_path, text: 'Uddiyanas')
    end

    it 'has link to Affirmations' do
      expect(page).to have_link(nil, href: my_activity_yoga_affirmation_index_path, text: 'Affirmations')
    end
  end
end
