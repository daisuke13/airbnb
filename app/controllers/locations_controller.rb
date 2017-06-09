class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @room = Room.find(params[:room_id])
    if @location.save
      redirect_to new_room_price_path(@room)
    else
      render :new
    end
  end

  private
  def location_params
    params.require(:location).permit(:country, :postal_code, :prefecture, :city, :street_address, :building).merge(room_id: params[:room_id])
  end
end
