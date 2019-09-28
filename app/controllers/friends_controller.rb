# frozen_string_literal: true

class FriendsController < ApplicationController
  def index
    @friends = Account.all
  end
end
