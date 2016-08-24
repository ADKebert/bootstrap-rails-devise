class WheatsController < ApplicationController
  before_action :set_wheat, only: [:show, :edit, :update, :destroy]

  # GET /wheats
  def index
    @wheats = Wheat.all
  end

  # GET /wheats/1
  def show
  end

  # GET /wheats/new
  def new
    @wheat = Wheat.new
  end

  # GET /wheats/1/edit
  def edit
  end

  # POST /wheats
  def create
    @wheat = Wheat.new(wheat_params)

    if @wheat.save
      redirect_to @wheat, notice: 'Wheat was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wheats/1
  def update
    if @wheat.update(wheat_params)
      redirect_to @wheat, notice: 'Wheat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wheats/1
  def destroy
    @wheat.destroy
    redirect_to wheats_url, notice: 'Wheat was successfully destroyed.'
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
