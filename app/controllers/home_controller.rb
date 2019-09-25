# frozen_string_literal: true

class HomeController < ApplicationController
  layout 'home'

  def index
    redirect_to dashboard_index_path if account_signed_in?
  end
end
