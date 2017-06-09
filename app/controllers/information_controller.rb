class InformationController < ApplicationController
  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    @room = Room.find(params[:room_id])
    if @information.save
      redirect_to new_room_location_path(@room)
    else
      render :new
    end
  end

  private
  def information_params
    params.require(:information).permit(:room_type, :room_category, :acceptance_number, :bedrooms, :beds, :bathrooms).merge(room_id: params[:room_id])
  end
end
