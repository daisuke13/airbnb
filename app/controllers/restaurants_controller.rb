class RestaurantsController < ApplicationController
  def new
  end

  def create
    @url = restaurant_params
    respond_to do |format|
      format.json
    end
  end

  private
  def restaurant_params
    # params.require(:restaurants).map{ |restaurant| restaurant.permit(:name, :image, :url )}
    params.require(:restaurants).each do |key, value|
      rest = {}
      key.each do |key2, value2|
        rest.store(key2, value2)
      end
      rest = rest.merge(room_id: params[:room_id])
      Restaurant.create(rest)
    end
  end
end
