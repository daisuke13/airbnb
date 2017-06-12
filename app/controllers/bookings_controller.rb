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
    @room = Room.find(params[:id])
    @booking = current_user.bookings.last
  end

  def update
  end

  private
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guest).merge(room_id: params[:room_id], user_id: current_user.id)
  end
end
