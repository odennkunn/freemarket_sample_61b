class SignupController < ApplicationController

  def login
  end

  def index
  end

  def step1
    @user = User.new
    # binding.pry
  end

  def step2
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    # session[:family_name] = user_params[:family_name]
    # session[:last_name] = user_params[:last_name]
    # session[:kana_family_name] = user_params[:kana_family_name]
    # session[:kana_last_name] = user_params[:kana_last_name]
    # session[:birth_year] = user_params[:birth_year]
    # session[:birth_month] = user_params[:birth_month]
    # session[:birth_day] = user_params[:birth_day]
    session[:user_params] = user_params
    # session[:residence_attributes_after_step1] = user_params[:residence_attributes]
    # binding.pry
    @user = User.new(
      # nickname: session[:nickname],
      # email: session[:email],
      # password: session[:password],
      # password_confirmation: session[:password_confirmation],
      # family_name: session[:family_name],
      # last_name: session[:last_name],
      # kana_family_name: session[:kana_family_name],
      # kana_last_name: session[:kana_last_name],
      # birth_year: session[:birth_year],
      # birth_month: session[:birth_month],
      # birth_day: session[:birth_day]
      session[:user_params] = user_params
    )
    # @user.build_residence
    # binding.pry
  end

  def step3
    # session[:residence_attributes_after_step2] = user_params[:residence_attributes]
    # session[:residence_attributes_after_step2].merge!(session[:residence_attributes_after_step1])
    session[:phone_number] = user_params[:phone_number]
    # binding.pry
    @user = User.new(
      phone_number: session[:phone_number]
    )
    # @user.build_residence
    @user.build_residence
    # binding.pry
  end

  def step4
    # session[:prefecture_id] = residence_params[:prefecture_id]
    # session[:address_number] = residence_params[:address_number]
    # session[:municipal] = residence_params[:municipal]
    # session[:address] = residence_params[:address]
    # session[:building] = residence_params[:building]
    # session[:residence_attributes_after_step3] = user_params[:residence_attributes]
    # session[:residence_attributes_after_step3].merge!(session[:residence_attributes_after_step2])
    session[:residence_attributes_step3] = user_params[:residence_attributes]
    @user = User.new(
      family_name: session[:family_name],
      last_name: session[:last_name],
      kana_family_name: session[:kana_family_name],
      kana_last_name: session[:kana_last_name],
      phone_number: session[:phone_number]
    )
    @user.build_residence
    binding.pry
    # @residence = Residence.new(
    #   user_id: @user.id,
    #   prefecture_id: session[:prefecture_id],
    #   address_number: session[:address_number],
    #   municipal: session[:municipal],
    #   address: session[:address],
    #   building: session[:building]
    # )
  end

  def create

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
      :phone_number,
      residence_attributes: [:id, :prefecture_id, :address_number, :municipal, :address, :building]
    )
  end

  # def residence_params
  #   params.require(:residence).permit(
  #     :user_id
  #     :prefecture_id,
  #     :address_number,
  #     :municipal,
  #     :address,
  #     :building
  #   )
  # end
end
