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

  def filter_types
    filter_type = params[:id]
    case filter_type
    when "no_filter"
      return
    when "0"
      return
    when "1"
      categories = ProjectCategory.all
      render json: categories, only: [:name]
    when "2"
      areas = ProjectArea.all
      render json: areas, only: [:name]
    when "3"
      professors = User.all.where(userable_type: "Professor");
      render json: professors, only: [:first_name, :last_name, :email]
    when "4"
      departments = Department.all
      render json: departments, only: [:name]
    when "5"
      return
    when "6"
      institutions = Institution.all
      render json: institutions, only: [:name, :id]
    else
      return
    end
    
    #@areas = ProjectAreas.all
    #@profesors = User.all.where(userable_type: "Professor") REVISAR para nombre y correo juntos
    #@departments = Departments.all
    #@materias = Courses.all;
    #@institutions = Institution.all
    
  end

  def filter
    if current_user.professor?
      professor_id = current_user.userable.id
      results = Project.where(professor_id: professor_id)
      puts "RESULTS -----------------------!!!!!!!"
      puts results.inspect
    elsif current_user.student?
      student_id = current_user.userable.id
      results = Project.all.where(student_id: student_id)
    else
      results = Project.all
    end
    puts "STATUS ---"
    puts params[:status]
    if params[:status].present?
      if params[:status] == 'no_filter' 
        results2 = results
      else 
        results2 = results.where(status: params[:status])
      end
    else
      results2 = results
    end
    puts "RESULTS 2-----------------------!!!!!!!"
    puts results2.inspect
    filter_by = params[:filter_by]
    puts "Filter By ----------!!!"
    puts filter_by
    case filter_by
    when "no_filter"
      @projects = results2
    when "0"
      @projects = results2
    when "1"
      results3 = []
      results2.each do |project|
        if project.project_category == params[:filter_option]
          results3.append(project)
        end
      end
      @projects = results3
      
    when "2"
      results3 = []
      results2.each do |project|
        if project.project_area == params[:filter_option]
          results3.append(project)
        end
      end
      @projects = results3
    when "3"
      results3 = []
      results2.each do |project|
        professor = Professor.find(project.professor_id).user.email
        if professor == params[:filter_option]
          results3.append(project)
        end
      end
      @projects = results3
    #when "4"
      #departments
    #when "5"
      #Materia
    when "6"
      #Institution
      results3 = []
      results2.each do |project|
        institution = project.student.user.institution_id
        if institution.to_s == params[:filter_option]
          results3.append(project)
        end
      end
      @projects = results3
      puts @projects.inspect
    when "7"
      results3 = []
      results2.each do |project|
        yesNo = "no"
        if project.servicio == true
          yesNo = "yes"
        end
        if yesNo == params[:filter_option]
          results3.append(project)
        end
      end
      @projects = results3
    else
      @projects = []
      return
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
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
                                      abstract_attributes: abstract_attributes)
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

end
