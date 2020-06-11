class StaffMembersController < ApplicationController
  before_action :set_staff_member, only: [:show, :edit, :update, :destroy]

  # GET /staff_members
  # GET /staff_members.json
  def index
    @staff_members = StaffMember.all
  end

  # GET /staff_members/1
  # GET /staff_members/1.json
  def show
  end

  # GET /staff_members/new
  def new
    @staff_member = StaffMember.new
  end

  # GET /staff_members/1/edit
  def edit
  end

  # POST /staff_members
  # POST /staff_members.json
  def create
    @staff_member = StaffMember.new(staff_member_params)

    respond_to do |format|
      if @staff_member.save
        format.html { redirect_to @staff_member, notice: 'Staff member was successfully created.' }
        format.json { render :show, status: :created, location: @staff_member }
      else
        format.html { render :new }
        format.json { render json: @staff_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_members/1
  # PATCH/PUT /staff_members/1.json
  def update
    respond_to do |format|
      if @staff_member.update(staff_member_params)
        format.html { redirect_to @staff_member, notice: 'Staff member was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff_member }
      else
        format.html { render :edit }
        format.json { render json: @staff_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_members/1
  # DELETE /staff_members/1.json
  def destroy
    @staff_member.destroy
    respond_to do |format|
      format.html { redirect_to staff_members_url, notice: 'Staff member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_member
      @staff_member = StaffMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_member_params
      params.fetch(:staff_member, {})
    end
end
