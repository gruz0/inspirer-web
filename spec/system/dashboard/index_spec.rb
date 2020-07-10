# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the index view of Dashboard', type: :system do
  it_behaves_like 'unauthorized' do
    let(:path) { dashboard_index_path }
  end

  context 'with authorized access' do
    let(:account) { create(:account) }

    before do
      sign_in(account)

      visit dashboard_index_path
    end

    it 'has 5 cards' do
      expect(page.find('main')).to have_selector('.card', count: 5)
    end

    it 'has link to Health' do
      expect(page).to have_link(nil, href: my_health_index_path,
                                     text: I18n.t('views.dashboard.index.cards.health'))
    end

    it 'has link to Activity' do
      expect(page).to have_link(nil, href: my_activity_index_path,
                                     text: I18n.t('views.dashboard.index.cards.activity'))
    end

    it 'has link to Emotions' do
      expect(page).to have_link(nil, href: my_emotions_path,
                                     text: I18n.t('views.dashboard.index.cards.emotions'))
    end

    it 'has link to Learning' do
      expect(page).to have_link(nil, href: my_learning_index_path,
                                     text: I18n.t('views.dashboard.index.cards.learning'))
    end

    it 'has link to Family' do
      expect(page).to have_link(nil, href: my_family_index_path,
                                     text: I18n.t('views.dashboard.index.cards.family'))
    end
  end
end
