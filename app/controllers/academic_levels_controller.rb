class AcademicLevelsController < ApplicationController
  before_action :set_academic_level, only: [:show, :edit, :update, :destroy]

  # GET /academic_levels
  # GET /academic_levels.json
  def index
    @academic_levels = AcademicLevel.all
  end

  # GET /academic_levels/1
  # GET /academic_levels/1.json
  def show
  end

  # GET /academic_levels/new
  def new
    @academic_level = AcademicLevel.new
  end

  # GET /academic_levels/1/edit
  def edit
  end

  # POST /academic_levels
  # POST /academic_levels.json
  def create
    @academic_level = AcademicLevel.new(academic_level_params)

    respond_to do |format|
      if @academic_level.save
        format.html { redirect_to @academic_level, notice: 'Academic level was successfully created.' }
        format.json { render :show, status: :created, location: @academic_level }
      else
        format.html { render :new }
        format.json { render json: @academic_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_levels/1
  # PATCH/PUT /academic_levels/1.json
  def update
    respond_to do |format|
      if @academic_level.update(academic_level_params)
        format.html { redirect_to @academic_level, notice: 'Academic level was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_level }
      else
        format.html { render :edit }
        format.json { render json: @academic_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_levels/1
  # DELETE /academic_levels/1.json
  def destroy
    @academic_level.destroy
    respond_to do |format|
      format.html { redirect_to academic_levels_url, notice: 'Academic level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_level
      @academic_level = AcademicLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academic_level_params
      params.require(:academic_level).permit(:name)
    end
end
