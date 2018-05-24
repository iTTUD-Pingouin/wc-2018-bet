class UsersController < ApplicationController
before_action :find_user_by_id

  def show
  end

  def edit
    if @user == current_user || current_user.admin
      @user
    else
      redirect_to root_path
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    if @user == current_user || current_user.admin
      @user.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:pseudo, :group)
  end

  def find_user_by_id

    @user = User.find(params[:id])
    authorize @user
  end
end
