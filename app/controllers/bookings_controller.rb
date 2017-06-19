class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    if @booking.save
      redirect_to edit_booking_path(@booking)
    else
      render template: "rooms/show"
    end
  end

  def edit
    @booking = current_user.bookings.last
    @room = @booking.room
  end

  def update
    @booking = Booking.find(params[:id])
    @room = @booking.room
    @user = User.find(current_user.id)
    if @user.update(user_information_params)
      @booking.completed = true
      @booking.save
      redirect_to user_path(@user), notice: "予約が完了しました"
    else
      flash.now[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guest).merge(room_id: params[:room_id], user_id: current_user.id)
  end

  def user_information_params
    params.require(:user).permit(:billing_address, :card_number, :expiration_date)
  end
end
