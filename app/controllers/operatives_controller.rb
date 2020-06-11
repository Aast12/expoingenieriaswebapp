class OperativesController < ApplicationController
  before_action :set_operative, only: [:show, :edit, :update, :destroy]

  # GET /operatives
  # GET /operatives.json
  def index
    @operatives = Operative.all
  end

  # GET /operatives/1
  # GET /operatives/1.json
  def show
  end

  # GET /operatives/new
  def new
    @operative = Operative.new
  end

  # GET /operatives/1/edit
  def edit
  end

  # POST /operatives
  # POST /operatives.json
  def create
    @operative = Operative.new(operative_params)

    respond_to do |format|
      if @operative.save
        format.html { redirect_to @operative, notice: 'Operative was successfully created.' }
        format.json { render :show, status: :created, location: @operative }
      else
        format.html { render :new }
        format.json { render json: @operative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operatives/1
  # PATCH/PUT /operatives/1.json
  def update
    respond_to do |format|
      if @operative.update(operative_params)
        format.html { redirect_to @operative, notice: 'Operative was successfully updated.' }
        format.json { render :show, status: :ok, location: @operative }
      else
        format.html { render :edit }
        format.json { render json: @operative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operatives/1
  # DELETE /operatives/1.json
  def destroy
    @operative.destroy
    respond_to do |format|
      format.html { redirect_to operatives_url, notice: 'Operative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operative
      @operative = Operative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operative_params
      params.fetch(:operative, {})
    end
end
