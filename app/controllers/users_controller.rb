class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Thank you!"
      redirect_to root_path
    else
      flash[:danger] = @user.errors.full_messages.join(', ').capitalize
      redirect_to root_path(user: user_params)
    end
  end

  private

  def user_params
    return {} unless params[:user]
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
