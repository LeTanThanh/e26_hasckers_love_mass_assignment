class UsersController < ApplicationController
  before_action :load_user, only: %i(edit update)

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end

  def user_params
    params.require(:user).permit :name, :email
  end
end
