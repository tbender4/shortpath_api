class GroupContactsController < ApplicationController
  before_action :set_group_contact, only: %i[ show edit update destroy ]

  # GET /group_contacts or /group_contacts.json
  def index
    @group_contacts = GroupContact.all
  end

  # GET /group_contacts/1 or /group_contacts/1.json
  def show
  end

  # GET /group_contacts/new
  def new
    @group_contact = GroupContact.new
  end

  # GET /group_contacts/1/edit
  def edit
  end

  # POST /group_contacts or /group_contacts.json
  def create
    @group_contact = GroupContact.new(group_contact_params)

    respond_to do |format|
      if @group_contact.save
        format.html { redirect_to group_contact_url(@group_contact), notice: "Group contact was successfully created." }
        format.json { render :show, status: :created, location: @group_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_contacts/1 or /group_contacts/1.json
  def update
    respond_to do |format|
      if @group_contact.update(group_contact_params)
        format.html { redirect_to group_contact_url(@group_contact), notice: "Group contact was successfully updated." }
        format.json { render :show, status: :ok, location: @group_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_contacts/1 or /group_contacts/1.json
  def destroy
    @group_contact.destroy!

    respond_to do |format|
      format.html { redirect_to group_contacts_url, notice: "Group contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_contact
      @group_contact = GroupContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_contact_params
      params.require(:group_contact).permit(:group_id, :contact_id)
    end
end
