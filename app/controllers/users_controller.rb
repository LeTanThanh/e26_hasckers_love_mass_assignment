class UsersController < ApplicationController
  before_action :load_user, only: %i(edit update)

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path
    else
      render :new
    end
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
