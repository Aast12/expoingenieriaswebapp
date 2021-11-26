class ProjectsController < ApplicationController
  include ApplicationHelper
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if current_user.professor?
      professor_id = current_user.userable.id
      @projects = Project.all.where(professor_id: professor_id)
    elsif current_user.student?
      student_id = current_user.userable.id
      @projects = Project.all.where(student_id: student_id)
    else
      @projects = Project.all
    end
  end

  def filter_projects
    if current_user.professor?
      professor_id = current_user.userable.id
      @projects = Project.filter(filterable_params).where(professor_id: professor_id)
    elsif current_user.student?
      student_id = current_user.userable.id
      @projects = Project.filter(filterable_params).where(student_id: student_id)
    else
      @projects = Project.filter(filterable_params)
    end

    respond_to do |format|
      format.js
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @students = @project.students.build
    @project.build_project_detail
    @project.build_social_impact
    @project.build_abstract
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.edition_id = current_user.edition_id
    @project.institution_id = current_user.institution_id
    if current_user.professor?
      @project.professor_id = current_user.userable.id
    elsif current_user.student?
      @project.student_id = current_user.userable.id
    end
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /select_projects
  def select_projects
    current_projects = get_current_edition_projects()
    @projects = current_projects
  end

  # POST /update_selected_projects
  def update_selected_projects
    current_projects = get_current_edition_projects()
    selected_ids = params[:selected_projects]
    current_projects.each do |project|
      if selected_ids.include?(project.id.to_s)
        project.update_attribute(:status, 4)
      else
        project.update_attribute(:status, 5)
      end
    end
    respond_to do |format|
      format.html { redirect_to select_projects_path, notice: 'Status was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def project_status
    if current_user.professor?
      professor_id = current_user.userable.id
      @projects = Project.all.where(professor_id: professor_id)
    else
      @projects = Project.all
    end
  end

  def update_project_status
    project_statuses = params[:project_statuses]
    project_statuses.each do |project_status|
      parts = project_status.split(':')
      project = Project.find(parts[0])
      status = parts[1]
      project.update_attribute(:status, status)
    end
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Status was successfully updated.' }
      format.json { head :no_content }
    end


  end


  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:status, :student_id, :professor_id, :institution_id, :edition_id,
                                      project_detail_attributes: project_detail_attributes,
                                      social_impact_attributes: social_impact_attributes,
                                      abstract_attributes: abstract_attributes,
                                      students_attributes: [:id, :_destroy, :student_code],
                                      student_ids: [])
    end

    def project_detail_attributes
      params = project_detail_keys()
      params << :id
      params << :_destroy
      return params
    end

    def social_impact_attributes
      params = social_impact_keys()
      params << :id
      params << :_destroy
      return params
    end

    def abstract_attributes
      params = abstract_keys()
      params << :id
      params << :_destroy
      return params
    end


    def filterable_params
      params.permit(:name, :category, :area, :professor, :institution, :department, :social_service, :status)
    end
end
