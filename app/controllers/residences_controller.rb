class ResidencesController < ApplicationController

  def edit
    @residence = Residence.find(params[:id])
  end

  def update
    residence = Residence.find(params[:id])
    residence.update(residence_params)
    redirect_to "/users/#{current_user.id}"
    # if residence.user_id == current_user.id
    #   residence.update(residence_params)
    #   redirect_to user_path
    # else
    #   render :edit
    # end
  end

  private
  def residence_params
    params.require(:residence).permit(:address_number, :prefecture_id, :municipal, :address, :building)
  end
end
