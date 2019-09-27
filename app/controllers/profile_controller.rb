# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    # FIXME: Catch RecordNotFound exception and render error message
    @profile = Account.find(params[:id])
  end
end
