class ProjectEventDetailsController < ApplicationController
  before_action :set_project_event_detail, only: [:show, :edit, :update, :destroy]

  # GET /project_event_details
  # GET /project_event_details.json
  def index
    @project_event_details = ProjectEventDetail.all
  end

  # GET /project_event_details/1
  # GET /project_event_details/1.json
  def show
  end

  # GET /project_event_details/new
  def new
    @project_event_detail = ProjectEventDetail.new
  end

  # GET /project_event_details/1/edit
  def edit
  end

  # POST /project_event_details
  # POST /project_event_details.json
  def create
    @project_event_detail = ProjectEventDetail.new(project_event_detail_params)

    respond_to do |format|
      if @project_event_detail.save
        format.html { redirect_to @project_event_detail, notice: 'Project event detail was successfully created.' }
        format.json { render :show, status: :created, location: @project_event_detail }
      else
        format.html { render :new }
        format.json { render json: @project_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_event_details/1
  # PATCH/PUT /project_event_details/1.json
  def update
    respond_to do |format|
      if @project_event_detail.update(project_event_detail_params)
        format.html { redirect_to @project_event_detail, notice: 'Project event detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_event_detail }
      else
        format.html { render :edit }
        format.json { render json: @project_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_event_details/1
  # DELETE /project_event_details/1.json
  def destroy
    @project_event_detail.destroy
    respond_to do |format|
      format.html { redirect_to project_event_details_url, notice: 'Project event detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_event_detail
      @project_event_detail = ProjectEventDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_event_detail_params
      params.require(:project_event_detail).permit(:stand, :final_score, :project_id)
    end
end
