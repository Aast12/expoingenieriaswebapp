class CommitteeEvaluationsController < ApplicationController
  before_action :get_project
  before_action :set_committee_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /committee_evaluations
  # GET /committee_evaluations.json
  # Resource (singular) in routing file does not include index
  # def index
  #   @committee_evaluations = CommitteeEvaluation.all
  # end

  # GET /committee_evaluations/1
  # GET /committee_evaluations/1.json
  def show
  end

  # GET /committee_evaluations/new
  def new
    @committee_evaluation = @project.build_committee_evaluation
  end

  # GET /committee_evaluations/1/edit
  def edit
  end

  # POST /committee_evaluations
  # POST /committee_evaluations.json
  def create
    @committee_evaluation = @project.build_committee_evaluation(committee_evaluation_params)

    respond_to do |format|
      if @committee_evaluation.save
        format.html { redirect_to projects_path, notice: 'Committee evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @committee_evaluation }
      else
        format.html { render :new }
        format.json { render json: @committee_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee_evaluations/1
  # PATCH/PUT /committee_evaluations/1.json
  def update
    respond_to do |format|
      if @committee_evaluation.update(committee_evaluation_params)
        format.html { redirect_to projects_path, notice: 'Committee evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @committee_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @committee_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committee_evaluations/1
  # DELETE /committee_evaluations/1.json
  def destroy
    @committee_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to committee_evaluations_url, notice: 'Committee evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_committee_evaluation
      @committee_evaluation = @project.committee_evaluation
    end

    # Only allow a list of trusted parameters through.
    def committee_evaluation_params
      params.require(:committee_evaluation).permit(:description, :problem, :methodology, :feasibility, :results, :impact, :score, :project_id)
    end
end
