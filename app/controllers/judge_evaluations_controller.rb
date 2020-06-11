class JudgeEvaluationsController < ApplicationController
  before_action :set_judge_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /judge_evaluations
  # GET /judge_evaluations.json
  def index
    @judge_evaluations = JudgeEvaluation.all
  end

  # GET /judge_evaluations/1
  # GET /judge_evaluations/1.json
  def show
  end

  # GET /judge_evaluations/new
  def new
    @judge_evaluation = JudgeEvaluation.new
  end

  # GET /judge_evaluations/1/edit
  def edit
  end

  # POST /judge_evaluations
  # POST /judge_evaluations.json
  def create
    @judge_evaluation = JudgeEvaluation.new(judge_evaluation_params)

    respond_to do |format|
      if @judge_evaluation.save
        format.html { redirect_to @judge_evaluation, notice: 'Judge evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @judge_evaluation }
      else
        format.html { render :new }
        format.json { render json: @judge_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /judge_evaluations/1
  # PATCH/PUT /judge_evaluations/1.json
  def update
    respond_to do |format|
      if @judge_evaluation.update(judge_evaluation_params)
        format.html { redirect_to @judge_evaluation, notice: 'Judge evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @judge_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @judge_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /judge_evaluations/1
  # DELETE /judge_evaluations/1.json
  def destroy
    @judge_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to judge_evaluations_url, notice: 'Judge evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_judge_evaluation
      @judge_evaluation = JudgeEvaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def judge_evaluation_params
      params.require(:judge_evaluation).permit(:judge_id, :project_id, :score)
    end
end
