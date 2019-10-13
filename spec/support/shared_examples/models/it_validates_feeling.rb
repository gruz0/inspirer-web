# frozen_string_literal: true

RSpec.shared_examples 'it validates feeling' do
  it_behaves_like 'it has enum', :feeling, FEELINGS
end
