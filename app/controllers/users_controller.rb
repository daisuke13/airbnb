class UsersController < ApplicationController
  def show
    @booking = Booking.new
  end

  def edit
    @booking = Booking.new
  end

  def update
  end
end
