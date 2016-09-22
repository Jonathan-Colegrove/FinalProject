class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def resources
  end
end
