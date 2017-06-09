class PricesController < ApplicationController
  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    @room = Room.find(params[:room_id])
    if @price.save
      redirect_to edit_room_path(@room)
    else
      render :new
    end
  end

  private
  def price_params
    params.require(:price).permit(:price, :currency).merge(room_id: params[:room_id])
  end
end
