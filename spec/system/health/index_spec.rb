# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the index view of Health section', type: :system do
  it_behaves_like 'unauthorized' do
    let(:path) { my_health_index_path }
  end

  context 'with authorized access' do
    let(:account) { create(:account) }

    before do
      sign_in(account)

      visit my_health_index_path
    end

    it 'has 4 cards' do
      expect(page.find('main')).to have_selector('.card', count: 4)
    end

    it 'has link to Sleep' do
      expect(page).to have_link(nil, href: my_health_sleeps_path,
                                     text: I18n.t('views.my.health.index.cards.sleep'))
    end

    it 'has link to Body Weight' do
      expect(page).to have_link(nil, href: my_health_body_weights_path,
                                     text: I18n.t('views.my.health.index.cards.body_weight'))
    end

    it 'has link to Body Measures' do
      expect(page).to have_link(nil, href: my_health_body_measures_path,
                                     text: I18n.t('views.my.health.index.cards.body_measures'))
    end

    it 'has link to Meditations' do
      expect(page).to have_link(nil, href: my_health_meditations_path,
                                     text: I18n.t('views.my.health.index.cards.meditations'))
    end
  end
end
