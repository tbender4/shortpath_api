# frozen_string_literal: true

# Building drives the authorization of managing floors
class FloorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_building, only: %i[index create]
  before_action :set_floor, only: %i[show update destroy]

  # GET /floors or /floors.json
  def index
    authorize @building, :update?, policy_class: BuildingPolicy
    @floors = @building.floors
  end

  # GET /floors/1 or /floors/1.json
  def show
    authorize @floor.building, policy_class: BuildingPolicy
  end

  # POST /floors or /floors.json
  def create
    authorize @building, :update?, policy_class: BuildingPolicy
    @floor = Floor.new(floor_params)
    if @floor.save
      render :show, status: :created, location: @floor
    else
      render json: @floor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /floors/1 or /floors/1.json
  def update
    authorize @floor.building, :update?, policy_class: BuildingPolicy
    if @floor.update(floor_params)
      render :show, status: :ok, location: @floor
    else
      render json: @floor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /floors/1 or /floors/1.json
  def destroy
    authorize @floor.building, :update?, policy_class: BuildingPolicy
    @floor.destroy!
    render notice: 'Floor was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_floor
    @floor = Floor.find(params[:id])
  end

  def set_building
    @building = Building.find(params[:building_id])
    # TODO: Break if floor not part of building
  end

  # Only allow a list of trusted parameters through.
  def floor_params
    params.require(:space).permit(:name, :flevel)
  end
end
