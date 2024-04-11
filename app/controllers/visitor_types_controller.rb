# frozen_string_literal: true

# vt
class VisitorTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_building, only: %i[index create]
  before_action :set_visitor_type, only: %i[show update destroy]

  # GET /visitor_types or /visitor_types.json
  def index
    authorize @building, :show?
    @floors = @building.visitor_types
  end

  # GET /visitor_types/1 or /visitor_types/1.json
  def show
    authorize @visitor_type.building
  end

  # POST /visitor_types or /visitor_types.json
  def create
    authorize @building, :show?
    @visitor_type = VisitorType.new(visitor_type_params)
    @visitor_type.building = @building

    if @visitor_type.save
      render :show, status: :created, location: @visitor_type
    else
      render json: @visitor_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visitor_types/1 or /visitor_types/1.json
  def update
    authorize @visitor_type.building
    if @visitor_type.update(visitor_type_params)
      render :show, status: :ok, location: @visitor_type
    else
      render json: @visitor_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visitor_types/1 or /visitor_types/1.json
  def destroy
    authorize @visitor_type.building, :show?
    @visitor_type.destroy!

    render(json: { notice: 'Visitor Type was successfully destroyed.' })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_visitor_type
    @visitor_type = VisitorType.find(params[:id])
  end

  def set_building
    @building = Building.find(params[:building_id])
    # TODO: Break if floor not part of building
  end

  # Only allow a list of trusted parameters through.
  def visitor_type_params
    params.require(:visitor_type).permit(:name, :category, :hide_barcode)
  end
end
