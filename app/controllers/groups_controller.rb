# frozen_string_literal: true

# groups and ting
class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show update destroy]
  # GET /groups or /groups.json
  def index
    # authorize Group
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    authorize @group
  end

  # POST /groups or /groups.json
  def create
    authorize Group
    @group = Group.new(group_params)

    if @group.save
      render :show, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    authorize @group
    if @group.update(group_params)
      render :show, status: :ok, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    authorize @group
    @group.destroy!

    render(json: { notice: 'Group was successfully destroyed.' })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.fetch(:group, {})
  end
end
