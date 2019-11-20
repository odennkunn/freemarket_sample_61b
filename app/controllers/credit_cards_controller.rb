class CreditCardsController < ApplicationController

  before_action :credit_cards_info, only: [:show]
  before_action :set_residence, only: [:show, :new]
  require "payjp"
  Payjp.api_key = Rails.application.credentials.aws[:payjp_private_key]

  def new
    card = CreditCard.where(user_id: current_user.id).first
    redirect_to action: 'show' if card.present?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.aws[:payjp_private_key]
    if params['payjp-token'].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: 'show'
      else
        redirect_to new_credit_card_path
      end
    end
  end

  def delete
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to new_credit_card_path
  end

  def show
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id)
    end
  end


  private 

  def credit_cards_info
    @card = current_user.credit_cards
    Payjp.api_key = Rails.application.credentials.aws[:payjp_private_key]
    card = @card[0]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card = customer.cards.retrieve(card.card_id)
    return @card
  end

  def set_residence
    @residence = current_user.residence
  end
end
