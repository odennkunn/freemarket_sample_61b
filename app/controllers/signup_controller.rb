class SignupController < ApplicationController
  before_action :save_step1, only: :step2
  before_action :save_step2, only: :step3
  before_action :save_step3, only: :step4
  before_action :create, only: :pay
  
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.aws[:payjp_private_key]

  def index
  end

  def step1
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email]
    )
  end

  def save_step1
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
  
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      last_name: session[:last_name],
      kana_family_name: session[:kana_family_name],
      kana_last_name: session[:kana_last_name],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )

    
    unless verify_recaptcha && @user.valid?
      render 'signup/step1'
    end
  end

  def step2
    @user = User.new
  end

  def save_step2
    session[:phone_number] = user_params[:phone_number]
  end

  def step3
    @user = User.new(
      family_name: session[:family_name],
      last_name: session[:last_name],
      kana_family_name: session[:kana_family_name],
      kana_last_name: session[:kana_last_name]   
    )
    @user.build_residence
  end

  def save_step3
    session[:family_name] = user_params[:family_name]
    session[:last_name] = user_params[:last_name]
    session[:kana_family_name] = user_params[:kana_family_name]
    session[:kana_last_name] = user_params[:kana_last_name]    
    session[:residence_attributes_step3] = user_params[:residence_attributes]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      last_name: session[:last_name],
      kana_family_name: session[:kana_family_name],
      kana_last_name: session[:kana_last_name],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number]
    )
    @user.build_residence(
      session[:residence_attributes_step3]
    )

    render 'signup/step3' unless @user.valid?
  end

  def step4
    @user = User.new
    @user.build_residence
  end

  def create
    
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      last_name: session[:last_name],
      kana_family_name: session[:kana_family_name],
      kana_last_name: session[:kana_last_name],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number]
    )
    
    @user.build_residence(session[:residence_attributes_step3])
    if @user.save
      session[:id] = @user.id
    else
      render '/signup/step1'
    end

  end

  def pay
    Payjp.api_key = Rails.application.credentials.aws[:payjp_private_key]
    if params['payjp-token'].blank?
      redirect_to step4_signup_index_path
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      )
      @card = CreditCard.new(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_signup_signup_index_path
      else
        render '/signup/step4'
      end
    end
  end


  def complete_signup
    sign_in User.find(session[:id]) unless user_signed_in?
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
end
