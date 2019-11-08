class SignupController < ApplicationController
  before_action :save_step1, only: :step2
  before_action :save_step2, only: :step3
  before_action :save_step3, only: :step4
  
  def index
  end

  def step1
    @user = User.new
    # @user.build_residence
    # binding.pry
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
    # binding.pry
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
    # @user.build_residence(
    #   prefecture_id: "1", 
    #   address_number: "111-1111", 
    #   municipal: "名古屋市中区", 
    #   address: "中央町", 
    #   building: "柳ビル103"
    # )
    # binding.pry
    render 'signup/step1' unless @user.valid?
    unless verify_recaptcha(model: @user)
      'signup/step1'
    end
  end

  def step2
    @user = User.new
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
    # session[:user_params] = user_params
    # session[:residence_attributes_after_step1] = user_params[:residence_attributes]
    # binding.pry
    # @user = User.new(
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
      # session[:user_params]
    # )
    # @user.build_residence
    # binding.pry
  end

  def save_step2
    session[:phone_number] = user_params[:phone_number]
    # binding.pry
  end

  def step3
    # session[:residence_attributes_after_step2] = user_params[:residence_attributes]
    # session[:residence_attributes_after_step2].merge!(session[:residence_attributes_after_step1])
    # binding.pry
    @user = User.new(
      family_name: session[:family_name],
      last_name: session[:last_name],
      kana_family_name: session[:kana_family_name],
      kana_last_name: session[:kana_last_name]   
    )
    @user.build_residence
    # binding.pry
  end

  def save_step3
    # binding.pry
    session[:family_name] = user_params[:family_name]
    session[:last_name] = user_params[:last_name]
    session[:kana_family_name] = user_params[:kana_family_name]
    session[:kana_last_name] = user_params[:kana_last_name]    
    session[:residence_attributes_step3] = user_params[:residence_attributes]

    # session[:prefecture_id] = user_params[:residence_attributes][:prefecture_id]
    # session[:address_number] = user_params[:residence_attributes][:address_number]
    # session[:municipal] = user_params[:residence_attributes][:municipal]
    # session[:address] = user_params[:residence_attributes][:address]
    # session[:building] = user_params[:residence_attributes][:building]

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
      # prefecture_id: session[:prefecture_id],
      # address_number: session[:address_number],
      # municipal: session[:municipal],
      # address: session[:address],
      # building: session[:building]
    )
    # binding.pry
    render 'signup/step3' unless @user.valid?
  end

  def step4
    @user = User.new
    @user.build_residence
    # session[:prefecture_id] = residence_params[:prefecture_id]
    # session[:address_number] = residence_params[:address_number]
    # session[:municipal] = residence_params[:municipal]
    # session[:address] = residence_params[:address]
    # session[:building] = residence_params[:building]
    # session[:residence_attributes_after_step3] = user_params[:residence_attributes]
    # session[:residence_attributes_after_step3].merge!(session[:residence_attributes_after_step2])
    # session[:residence_attributes_step3] = user_params[:residence_attributes]
    # binding.pry

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

    # @user.build_residence(
    #   prefecture_id: session[:prefecture_id],
    #   address_number: session[:address_number],
    #   municipal: session[:municipal],
    #   address: session[:address],
    #   building: session[:building]
    # )

    unless @user.save
      render '/signup/step1'
    end

    customer = Payjp::Customer.create(card: params[:payjp_token])
    @credit_card = Credit_card.new(user: @user, customer_id: customer.id, card_id: customer.default_card)

    if @credit_card.save
      session[:id] = @user.id
      redirect_to complete_signup_signup_index_path
    else
      render '/signup/step1'
    end
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
