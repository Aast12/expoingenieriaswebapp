class DaysgroupsController < ApplicationController
  before_action :set_daysgroup, only: [:show, :edit, :update, :destroy]

  # GET /daysgroups
  # GET /daysgroups.json
  def index
    @daysgroups = Daysgroup.all
  end

  # GET /daysgroups/1
  # GET /daysgroups/1.json
  def show
  end

  # GET /daysgroups/new
  def new
    @daysgroup = Daysgroup.new
  end

  # GET /daysgroups/1/edit
  def edit
  end

  # POST /daysgroups
  # POST /daysgroups.json
  def create
    @daysgroup = Daysgroup.new(daysgroup_params)

    respond_to do |format|
      if @daysgroup.save
        format.html { redirect_to @daysgroup, notice: 'Daysgroup was successfully created.' }
        format.json { render :show, status: :created, location: @daysgroup }
      else
        format.html { render :new }
        format.json { render json: @daysgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daysgroups/1
  # PATCH/PUT /daysgroups/1.json
  def update
    respond_to do |format|
      if @daysgroup.update(daysgroup_params)
        format.html { redirect_to @daysgroup, notice: 'Daysgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @daysgroup }
      else
        format.html { render :edit }
        format.json { render json: @daysgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daysgroups/1
  # DELETE /daysgroups/1.json
  def destroy
    @daysgroup.destroy
    respond_to do |format|
      format.html { redirect_to daysgroups_url, notice: 'Daysgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daysgroup
      @daysgroup = Daysgroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daysgroup_params
      params.require(:daysgroup).permit(:group)
    end
end
