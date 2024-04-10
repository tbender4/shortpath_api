# frozen_string_literal: true

# Manage building if you have building_admin permission. building_guard permission will be handled in another route.
class BuildingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_building, only: %i[show update destroy]

  # GET /buildings or /buildings.json
  def index
    # Scopes will be useful here
    authorize Building
    @buildings = policy_scope(Building)
  end

  # GET /buildings/1 or /buildings/1.json
  def show
    authorize @building
  end

  # POST /buildings or /buildings.json
  def create
    authorize Building
    @building = Building.new(building_params)
    if @building.save
      render :show, status: :created, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buildings/1 or /buildings/1.json
  def update
    if @building.update(building_params)
      render :show, status: :ok, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buildings/1 or /buildings/1.json
  def destroy
    @building.destroy!
    render(json: { notice: 'Building was successfully destroyed.' })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @building = Building.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def building_params
    params.require(:building).permit(:name, :code, :description, address_attributes: %i[
                                       street1 street2 city province zip time_zone
                                     ], floors_attributes: [:id, :name, :description, :flevel,
                                                            { spaces_attributes: %i[id name description] }])
  end
end
