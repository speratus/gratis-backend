class SessionsController < ApplicationController
  before_action :authenticated?, only: [:delete]

  def create
  end

  def delete
  end
end
