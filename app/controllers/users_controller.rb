class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Thank you! We'll let you know when our flowers are available."
      redirect_to root_path
    elsif User.find_by_email(user_params[:email].downcase)
      flash[:success] = "You already signed up! We'll reach out to you as soon as we're ready."
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
