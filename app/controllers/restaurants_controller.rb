class RestaurantsController < ApplicationController
  def new
  end

  def create
    @restaurants = restaurant_params
    binding.pry
    @restaurants.each do |restaurant|
      a_restaurant = Restaurant.new(restaurant)
      a_restaurant.save
    end
    redirect_to edit_restaurant_path
  end

  def edit
  end

  def update
  end

  private
  def restaurant_params
    params.require(:restaurants).map{ |restaurant| restaurant.permit(:name, :image, :url )}
  end
end
