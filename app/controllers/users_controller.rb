class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_information_params)
      redirect_to user_path(@user), notice: "カード情報を更新しました"
    else
      flash.now[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  private
  def user_information_params
    params.require(:user).permit(:billing_address, :card_number, :expiration_date)
  end
end
