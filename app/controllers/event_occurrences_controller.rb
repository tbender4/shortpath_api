class EventOccurrencesController < ApplicationController
  before_action :set_event_occurrence, only: %i[ show edit update destroy ]

  # GET /event_occurrences or /event_occurrences.json
  def index
    @event_occurrences = EventOccurrence.all
  end

  # GET /event_occurrences/1 or /event_occurrences/1.json
  def show
  end

  # GET /event_occurrences/new
  def new
    @event_occurrence = EventOccurrence.new
  end

  # GET /event_occurrences/1/edit
  def edit
  end

  # POST /event_occurrences or /event_occurrences.json
  def create
    @event_occurrence = EventOccurrence.new(event_occurrence_params)

    respond_to do |format|
      if @event_occurrence.save
        format.html { redirect_to event_occurrence_url(@event_occurrence), notice: "Event occurrence was successfully created." }
        format.json { render :show, status: :created, location: @event_occurrence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_occurrences/1 or /event_occurrences/1.json
  def update
    respond_to do |format|
      if @event_occurrence.update(event_occurrence_params)
        format.html { redirect_to event_occurrence_url(@event_occurrence), notice: "Event occurrence was successfully updated." }
        format.json { render :show, status: :ok, location: @event_occurrence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_occurrences/1 or /event_occurrences/1.json
  def destroy
    @event_occurrence.destroy!

    respond_to do |format|
      format.html { redirect_to event_occurrences_url, notice: "Event occurrence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_occurrence
      @event_occurrence = EventOccurrence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_occurrence_params
      params.require(:event_occurrence).permit(:event_id, :start_time, :end_time)
    end
end
