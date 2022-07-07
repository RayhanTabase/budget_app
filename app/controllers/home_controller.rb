class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  
  def index
    redirect_to categories_path if current_user
  end
end
