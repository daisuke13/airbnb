class PricesController < ApplicationController
  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to room_path(@price)
    else
      render :new
    end
  end

  private
  def price_params
    params.require(:location).permit(:price, :currency).merge(room_id: params[:room_id])
  end
end
