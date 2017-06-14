class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    if @booking.save
      redirect_to edit_booking_path(@room)
    else
      render template: "rooms/show"
    end
  end

  def edit
    @booking = current_user.bookings.last
    @room = Room.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @room = Room.find(@booking.room_id)
    if @booking.update(booking_update_params)
      redirect_to user_path(@booking), notice: "予約が完了しました"
    else
      flash.now[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guest).merge(room_id: params[:room_id], user_id: current_user.id)
  end

  def booking_update_params
    params.require(:booking).permit(:check_in, :check_out, :guest).merge(user_id: current_user.id)
  end
end
