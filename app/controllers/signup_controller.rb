class SignupController < ApplicationController

  def login
  end

  def index
  end

  def step1
    @user = User.new
    @residence = Residence.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:last_name] = user_params[:last_name]
    session[:kana_family_name] = user_params[:kana_family_name]
    session[:kana_last_name] = user_params[:kana_last_name]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new
    # binding.pry
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @residence = Residence.new
    binding.pry
  end

  def step4
    session[:prefecture_id] = residence_params[:prefecture_id]
    session[:address_number] = residence_params[:address_number]
    session[:municipal] = residence_params[:municipal]
    session[:address] = residence_params[:address]
    session[:building] = residence_params[:building]
    @user = User.new
    # @residence = Residence.new(
    #   user: @user,
    #   prefecture_id: session[:prefecture_id],
    #   address_number: session[:address_number],
    #   municipal: session[:municipal],
    #   address: session[:address],
    #   building: session[:building]
    # )
  end

  def complete_signup
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :family_name,
      :last_name,
      :kana_family_name,
      :kana_last_name,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number
    )
  end

  def residence_params
    params.require(:residence).permit(
      :user_id,
      :prefecture_id,
      :address_number,
      :municipal,
      :address,
      :building
    )
  end
end
