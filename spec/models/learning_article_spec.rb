# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningArticle, type: :model do
  subject(:model) { build_stubbed(:learning_article) }

  it_behaves_like 'it sanitizes notes'
end
