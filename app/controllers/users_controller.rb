class UsersController < ApplicationController
  before_action :set_residence, only: [:show, :edit, :logout]

  def show
    redirect_to root_path unless @residence
  end
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
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

  def set_residence
    @residence = current_user.residence
  end

end
