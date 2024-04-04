class EventOrganizersController < ApplicationController
  before_action :set_event_organizer, only: %i[ show edit update destroy ]

  # GET /event_organizers or /event_organizers.json
  def index
    @event_organizers = EventOrganizer.all
  end

  # GET /event_organizers/1 or /event_organizers/1.json
  def show
  end

  # GET /event_organizers/new
  def new
    @event_organizer = EventOrganizer.new
  end

  # GET /event_organizers/1/edit
  def edit
  end

  # POST /event_organizers or /event_organizers.json
  def create
    @event_organizer = EventOrganizer.new(event_organizer_params)

    respond_to do |format|
      if @event_organizer.save
        format.html { redirect_to event_organizer_url(@event_organizer), notice: "Event organizer was successfully created." }
        format.json { render :show, status: :created, location: @event_organizer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_organizers/1 or /event_organizers/1.json
  def update
    respond_to do |format|
      if @event_organizer.update(event_organizer_params)
        format.html { redirect_to event_organizer_url(@event_organizer), notice: "Event organizer was successfully updated." }
        format.json { render :show, status: :ok, location: @event_organizer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_organizers/1 or /event_organizers/1.json
  def destroy
    @event_organizer.destroy!

    respond_to do |format|
      format.html { redirect_to event_organizers_url, notice: "Event organizer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_organizer
      @event_organizer = EventOrganizer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_organizer_params
      params.require(:event_organizer).permit(:event_id, :user_id)
    end
end
