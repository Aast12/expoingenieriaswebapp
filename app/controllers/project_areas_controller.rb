class ProjectAreasController < ApplicationController
  before_action :set_project_area, only: [:show, :edit, :update, :destroy]

  # GET /project_areas
  # GET /project_areas.json
  def index
    @project_areas = ProjectArea.all
  end

  # GET /project_areas/1
  # GET /project_areas/1.json
  def show
  end

  # GET /project_areas/new
  def new
    @project_area = ProjectArea.new
  end

  # GET /project_areas/1/edit
  def edit
  end

  # POST /project_areas
  # POST /project_areas.json
  def create
    @project_area = ProjectArea.new(project_area_params)

    respond_to do |format|
      if @project_area.save
        format.html { redirect_to @project_area, notice: 'Project area was successfully created.' }
        format.json { render :show, status: :created, location: @project_area }
      else
        format.html { render :new }
        format.json { render json: @project_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_areas/1
  # PATCH/PUT /project_areas/1.json
  def update
    respond_to do |format|
      if @project_area.update(project_area_params)
        format.html { redirect_to @project_area, notice: 'Project area was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_area }
      else
        format.html { render :edit }
        format.json { render json: @project_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_areas/1
  # DELETE /project_areas/1.json
  def destroy
    @project_area.destroy
    respond_to do |format|
      format.html { redirect_to project_areas_url, notice: 'Project area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_area
      @project_area = ProjectArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_area_params
      params.require(:project_area).permit(:name)
    end
end
