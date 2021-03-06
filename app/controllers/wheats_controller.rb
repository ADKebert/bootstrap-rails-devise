class WheatsController < ApplicationController
  before_action :set_wheat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /wheats
  def index
    @wheats = current_user.wheats
  end

  # POST /wheats
  def create
    @wheat = Wheat.find_or_create_by(wheat_params)
    @wheat.users << current_user

    if @wheat.save
      redirect_to wheats_path, notice: "It's sprouting nicely."
    else
      redirect_to wheats_path, notice: "It wouldn't sprout"
    end
  end

  # DELETE /wheats/1
  def destroy
    current_user.wheats.delete(@wheat)
    redirect_to wheats_path, notice: 'Wheat was successfully harvested.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wheat
      @wheat = Wheat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wheat_params
      params.require(:wheat).permit(:user_id, :x, :y)
    end
end
