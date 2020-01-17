# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the index view of Productivity section', type: :system do
  it_behaves_like 'unauthorized' do
    let(:path) { my_productivity_index_path }
  end

  context 'with authorized access' do
    let(:account) { create(:account) }

    before do
      sign_in(account)

      visit my_productivity_index_path
    end

    it 'has 2 cards' do
      expect(page.find('main')).to have_selector('.card', count: 2)
    end

    it 'has link to Habbits' do
      expect(page).to have_link(nil, href: my_productivity_habbits_path,
                                     text: I18n.t('views.my.productivity.index.cards.habbits'))
    end

    it 'has link to Eat the Frog First' do
      expect(page).to have_link(nil, href: my_productivity_eat_the_frog_first_index_path,
                                     text: I18n.t('views.my.productivity.index.cards.eat_the_frog_first'))
    end
  end
end
