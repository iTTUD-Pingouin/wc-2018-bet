class UsersController < ApplicationController
before_action :find_user_by_id

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:pseudo)
  end

  def find_user_by_id
    @user = User.find(params[:id])
  end
end
