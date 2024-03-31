class BuildingAccountsController < ApplicationController
  before_action :set_building_account, only: %i[ show edit update destroy ]

  # GET /building_accounts or /building_accounts.json
  def index
    @building_accounts = BuildingAccount.all
  end

  # GET /building_accounts/1 or /building_accounts/1.json
  def show
  end

  # GET /building_accounts/new
  def new
    @building_account = BuildingAccount.new
  end

  # GET /building_accounts/1/edit
  def edit
  end

  # POST /building_accounts or /building_accounts.json
  def create
    @building_account = BuildingAccount.new(building_account_params)

    respond_to do |format|
      if @building_account.save
        format.html { redirect_to building_account_url(@building_account), notice: "Building account was successfully created." }
        format.json { render :show, status: :created, location: @building_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @building_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /building_accounts/1 or /building_accounts/1.json
  def update
    respond_to do |format|
      if @building_account.update(building_account_params)
        format.html { redirect_to building_account_url(@building_account), notice: "Building account was successfully updated." }
        format.json { render :show, status: :ok, location: @building_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @building_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /building_accounts/1 or /building_accounts/1.json
  def destroy
    @building_account.destroy!

    respond_to do |format|
      format.html { redirect_to building_accounts_url, notice: "Building account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_account
      @building_account = BuildingAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_account_params
      params.require(:building_account).permit(:building_id)
    end
end
