class UsersController < ApplicationController

  # before_filter :authorize, except: [:index]
  # before_filter :authorize, only: [:show]

  def index

  end

  def show
    @user = current_user
    user_id = current_user.id
    @posts = Post.where(user_id: user_id).all
    @full_time = @user.created_at
    @time = @full_time.to_s[0,10]
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/signup'
    end
  end

  def edit
    user_id = current_user.id
    @user = User.find_by_id(user_id)
  end

  def update
    user_id = current_user.id
    @user = User.find_by_id(user_id)

    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end


private

  def user_params
    params.require(:user).permit(:name, :current_city, :email, :password, :password_confirmation)
  end

end
