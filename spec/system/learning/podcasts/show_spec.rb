# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing the Learning Podcast', type: :system do
  let(:account) { create(:account) }
  let(:learning_podcast) do
    create(:learning_podcast,
           url: 'http://example.com',
           title: 'Some Text',
           feeling: 'amazing',
           account: account)
  end

  it_behaves_like 'unauthorized' do
    let(:path) { my_learning_podcast_path(learning_podcast) }
  end

  context 'with authorized access' do
    before do
      sign_in(account)

      visit my_learning_podcast_path(learning_podcast)
    end

    it 'has clickable title' do
      expect(page).to have_link(nil, href: 'http://example.com', text: 'Some Text')
    end
  end
end
