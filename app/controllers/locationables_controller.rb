class LocationablesController < ApplicationController
  before_action :set_locationable, only: %i[ show edit update destroy ]

  # GET /locationables or /locationables.json
  def index
    @locationables = Locationable.all
  end

  # GET /locationables/1 or /locationables/1.json
  def show
  end

  # GET /locationables/new
  def new
    @locationable = Locationable.new
  end

  # GET /locationables/1/edit
  def edit
  end

  # POST /locationables or /locationables.json
  def create
    @locationable = Locationable.new(locationable_params)

    respond_to do |format|
      if @locationable.save
        format.html { redirect_to locationable_url(@locationable), notice: "Locationable was successfully created." }
        format.json { render :show, status: :created, location: @locationable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @locationable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locationables/1 or /locationables/1.json
  def update
    respond_to do |format|
      if @locationable.update(locationable_params)
        format.html { redirect_to locationable_url(@locationable), notice: "Locationable was successfully updated." }
        format.json { render :show, status: :ok, location: @locationable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @locationable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locationables/1 or /locationables/1.json
  def destroy
    @locationable.destroy!

    respond_to do |format|
      format.html { redirect_to locationables_url, notice: "Locationable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locationable
      @locationable = Locationable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def locationable_params
      params.fetch(:locationable, {})
    end
end
