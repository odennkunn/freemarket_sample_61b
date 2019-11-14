class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  def show
    
  end
  
  def edit
    # @user = User.find(params[:id])
    # @nickname = user.nickname
    # @introduction = user.introduction
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def logout
  end
  
  def card
  end

  def confirm
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction)
  end
  
end
