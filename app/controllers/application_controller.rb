# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  protect_from_forgery with: :exception

  private

  ACTION_MAP = {
    create: :create,
    update: :update
  }.freeze

  def action
    ACTION_MAP[params[:action].to_sym]
  end
end
