class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  
  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def show
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

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :phone, :country)
  end
end