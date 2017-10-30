class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  before_action :set_restaurant, only: [:show]
  def index

  end

  def show

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
