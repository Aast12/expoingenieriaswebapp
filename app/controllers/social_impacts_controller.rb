class SocialImpactsController < ApplicationController
  before_action :set_social_impact, only: [:show, :edit, :update, :destroy]

  # GET /social_impacts
  # GET /social_impacts.json
  def index
    @social_impacts = SocialImpact.all
  end

  # GET /social_impacts/1
  # GET /social_impacts/1.json
  def show
  end

  # GET /social_impacts/new
  def new
    @social_impact = SocialImpact.new
  end

  # GET /social_impacts/1/edit
  def edit
  end

  # POST /social_impacts
  # POST /social_impacts.json
  def create
    @social_impact = SocialImpact.new(social_impact_params)

    respond_to do |format|
      if @social_impact.save
        format.html { redirect_to @social_impact, notice: 'Social impact was successfully created.' }
        format.json { render :show, status: :created, location: @social_impact }
      else
        format.html { render :new }
        format.json { render json: @social_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_impacts/1
  # PATCH/PUT /social_impacts/1.json
  def update
    respond_to do |format|
      if @social_impact.update(social_impact_params)
        format.html { redirect_to @social_impact, notice: 'Social impact was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_impact }
      else
        format.html { render :edit }
        format.json { render json: @social_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_impacts/1
  # DELETE /social_impacts/1.json
  def destroy
    @social_impact.destroy
    respond_to do |format|
      format.html { redirect_to social_impacts_url, notice: 'Social impact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_impact
      @social_impact = SocialImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_impact_params
      params.require(:social_impact).permit(social_impact_keys())
    end
end
