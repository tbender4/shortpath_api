class LeasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_space, only: %i[index create]
  before_action :set_lease, only: %i[show update destroy]

  # GET /leases or /leases.json
  def index
    authorize @space.building, :show?
    @leases = @space.leases
  end

  # GET /leases/1 or /leases/1.json
  def show
    authorize @lease.building
  end

  # POST /leases or /leases.json
  def create
    authorize @space.building, :show?
    @lease = Lease.new(lease_create_params)
    @lease.space = @space

    if @lease.save
      render :show, status: :created, location: @lease
    else
      render json: @lease.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leases/1 or /leases/1.json
  def update
    authorize @lease.building, :show?
    if @lease.update(lease_update_params)
      render :show, status: :ok, location: @lease
    else
      render json: @lease.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leases/1 or /leases/1.json
  # Leases cannot be destroyed. Only retired.
  def destroy
    authorize @lease.building, :show?
    @lease.retire!
    render :show, status: :ok, location: @lease
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lease
    @lease = Lease.find(params[:id])
  end

  def set_space
    @lease = Space.find(params[:space_id])
  end

  # Only allow a list of trusted parameters through.
  def lease_create_params
    # Associate an existing group_id, or supply attributes for a NEW group.
    params.require(:lease).permit(
      :start_date, :end_date, :group_id, group_attributes: %i[name description]
    )
  end

  def lease_update_params
    params.require(:lease).permit(:end_date, :state_event)
  end
end
