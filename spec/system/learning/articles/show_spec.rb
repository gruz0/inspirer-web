# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Learning Article', type: :system do
  let(:account) { create(:account) }
  let(:learning_article) do
    create(:learning_article,
           url: 'http://example.com',
           title: 'Some Text',
           notes: 'My <b>Notes</b>',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_learning_article_path(learning_article) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_learning_article_path(learning_article)
    end

    it 'has clickable title' do
      expect(page).to have_link(nil, href: 'http://example.com', text: 'Some Text')
    end

    it 'has notes' do
      expect(page.find(:id, 'notes')).to have_text('My Notes', exact: true)
    end
  end
end
