# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  protect_from_forgery with: :exception

  private

  ACTION_MAP = {
    create: :create,
    update: :update
  }.freeze

  def result
    @result ||= service.send(action, resource: resource, attributes: resource_params)
  end

  def service
    throw NotImplementedError
  end

  def action
    ACTION_MAP[params[:action].to_sym]
  end

  def resource
    if params[:id]
      resource_class.find(params[:id])
    else
      resource_class
    end
  end

  def resource_class
    throw NotImplementedError
  end

  def resource_params
    throw NotImplementedError
  end
end
