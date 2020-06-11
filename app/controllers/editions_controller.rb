class EditionsController < ApplicationController
  before_action :set_edition, only: [:show, :edit, :update, :destroy]

  # GET /editions
  # GET /editions.json
  def index
    @editions = Edition.all
  end

  # GET /editions/1
  # GET /editions/1.json
  def show
  end

  # GET /editions/new
  def new
    @edition = Edition.new
    @edition.time_limits.build(phase_name: "Inicio")
    @edition.time_limits.build(phase_name: "Planeación")
    @edition.time_limits.build(phase_name: "Evento")
    @edition.time_limits.build(phase_name: "Cierre")
    @edition.time_limits.build(phase_name: "Post Evento")
  end

  # GET /editions/1/edit
  def edit
  end

  # POST /editions
  # POST /editions.json
  def create
    @edition = Edition.new(edition_params)

    respond_to do |format|
      if @edition.save
        format.html { redirect_to @edition, notice: 'Edition was successfully created.' }
        format.json { render :show, status: :created, location: @edition }
      else
        format.html { render :new }
        format.json { render json: @edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editions/1
  # PATCH/PUT /editions/1.json
  def update
    respond_to do |format|
      if @edition.update(edition_params)
        format.html { redirect_to @edition, notice: 'Edition was successfully updated.' }
        format.json { render :show, status: :ok, location: @edition }
      else
        format.html { render :edit }
        format.json { render json: @edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editions/1
  # DELETE /editions/1.json
  def destroy
    @edition.destroy
    respond_to do |format|
      format.html { redirect_to editions_url, notice: 'Edition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edition
      @edition = Edition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def edition_params
      params.require(:edition).permit(:name, :start_date, :end_date, time_limits_attributes: time_limits_attributes)
    end

    def time_limits_attributes
      params = time_limit_keys()
      params << :id
      params << :_destroy
      return params
    end
end
