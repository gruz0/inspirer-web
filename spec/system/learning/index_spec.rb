# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the index view of Learning section', type: :system do
  it_behaves_like 'unauthorized' do
    let(:path) { my_learning_index_path }
  end

  context 'with authorized access' do
    let(:account) { create(:account) }

    before do
      sign_in(account)

      visit my_learning_index_path
    end

    it 'has 4 cards' do
      expect(page.find('main')).to have_selector('.card', count: 4)
    end

    it 'has link to Videos' do
      expect(page).to have_link(nil, href: my_learning_videos_path,
                                     text: I18n.t('views.my.learning.index.cards.videos'))
    end

    it 'has link to Podcasts' do
      expect(page).to have_link(nil, href: my_learning_podcasts_path,
                                     text: I18n.t('views.my.learning.index.cards.podcasts'))
    end

    it 'has link to Articles' do
      expect(page).to have_link(nil, href: my_learning_articles_path,
                                     text: I18n.t('views.my.learning.index.cards.articles'))
    end

    it 'has link to Books' do
      expect(page).to have_link(nil, href: my_learning_books_path,
                                     text: I18n.t('views.my.learning.index.cards.books'))
    end
  end
end
