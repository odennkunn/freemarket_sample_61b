class UsersController < ApplicationController

  def show
  end
  
  def edit
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
