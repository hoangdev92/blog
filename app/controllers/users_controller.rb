class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'update thanh cong'
    else
      flash[:error] = 'update thanh cong'
    end
    redirect_to edit_user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :phone, :country)
  end
end