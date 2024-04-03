class VisitorTypesController < ApplicationController
  before_action :set_visitor_type, only: %i[ show edit update destroy ]

  # GET /visitor_types or /visitor_types.json
  def index
    @visitor_types = VisitorType.all
  end

  # GET /visitor_types/1 or /visitor_types/1.json
  def show
  end

  # GET /visitor_types/new
  def new
    @visitor_type = VisitorType.new
  end

  # GET /visitor_types/1/edit
  def edit
  end

  # POST /visitor_types or /visitor_types.json
  def create
    @visitor_type = VisitorType.new(visitor_type_params)

    respond_to do |format|
      if @visitor_type.save
        format.html { redirect_to visitor_type_url(@visitor_type), notice: "Visitor type was successfully created." }
        format.json { render :show, status: :created, location: @visitor_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitor_types/1 or /visitor_types/1.json
  def update
    respond_to do |format|
      if @visitor_type.update(visitor_type_params)
        format.html { redirect_to visitor_type_url(@visitor_type), notice: "Visitor type was successfully updated." }
        format.json { render :show, status: :ok, location: @visitor_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitor_types/1 or /visitor_types/1.json
  def destroy
    @visitor_type.destroy!

    respond_to do |format|
      format.html { redirect_to visitor_types_url, notice: "Visitor type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_type
      @visitor_type = VisitorType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitor_type_params
      params.require(:visitor_type).permit(:building_id, :name, :category, :hide_barcode)
    end
end
