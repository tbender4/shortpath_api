class SpacesController < ApplicationController
  before_action :set_floor, only: %i[index create]
  before_action :set_space, only: %i[show update destroy]

  # GET /spaces or /spaces.json
  def index
    authorize @space.building, :show?

    @spaces = @floor.spaces
  end

  # GET /spaces/1 or /spaces/1.json
  def show
    authorize @space.building
  end

  # POST /spaces or /spaces.json
  def create
    authorize @floor.building, :show?
    @space = Space.new(space_params)
    @space.floor = @floor
    if @space.save
      render :show, status: :created, location: @space
    else
      render json: @space.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spaces/1 or /spaces/1.json
  def update
    authorize @space.building
    if @space.update(space_params)
      render :show, status: :ok, location: @space
    else
      render json: @space.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spaces/1 or /spaces/1.json
  def destroy
    authorize @space.building, :show?
    @space.destroy!
    render(json: { notice: 'Space was successfully destroyed.' })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_space
    @space = Space.find(params[:id])
  end

  def set_floor
    @floor = Floor.find(params[:floor_id])
  end

  # Only allow a list of trusted parameters through.
  def space_params
    params.require(:space).permit(:name, :description)
  end
end
