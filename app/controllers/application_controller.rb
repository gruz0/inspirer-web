# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  protect_from_forgery with: :exception

  private

  ACTION_MAP = {
    create: :create,
    update: :update
  }.freeze

  include Pagy::Backend

  def index
    @pagy, @records = pagy(resource.order(created_at: :desc))
  end

  def show
    @record = resource
  end

  def new
    @record = resource.new
  end

  def create
    if result.success?
      redirect_to yield, notice: 'Record was successfully created'
    else
      @errors = result.failure
      @record = resource_class.new(resource_params)
      render :new
    end
  end

  def edit
    @record = resource
  end

  def update
    if result.success?
      redirect_to yield, notice: 'Record was successfully updated'
    else
      @errors = result.failure
      @record = resource_class.new(resource_params)
      render :edit
    end
  end

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
