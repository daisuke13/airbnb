class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
    respond_to do |format|
      format.html
      format.json {
        @restaurants = Restaurants.where("id > ?", params[:id])
      }
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @room = Room.find(params[:room_id])
    if @restaurant.save
      redirect_to root_path(@room)
    else
      render :new
    end
  end

  private
  def price_params
    params.require(:restaurant).permit(:name, :image, :url).merge(room_id: params[:room_id])
  end
end
