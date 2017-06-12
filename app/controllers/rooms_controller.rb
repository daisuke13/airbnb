class RoomsController < ApplicationController
  def index
    @rooms = Room.where.not(image: nil)
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

  def edit
   @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to root_path(@room), notice: "ホスティング完了"
    else
      flash.now[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
  end

  private
  def room_params
    params.require(:room).permit(:name, :image, :discription)
  end
end
