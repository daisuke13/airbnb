class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new
    if @room.save
      redirect_to new_room_information_path(@room)
    else
      render :new
    end
  end
end
