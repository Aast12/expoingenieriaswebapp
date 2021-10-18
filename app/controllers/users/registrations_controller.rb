# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
   super do

    
    if resource.is_student
      create_userable("Student")
    end

    if resource.is_professor
      create_userable("Professor")
    end

    if resource.is_judge
      create_userable("Judge")
    end
    
    if resource.is_committee_member 
      create_userable("CommitteeMember")
    end 

    if resource.is_admin
      create_userable("Administrator")
    end

    if resource.is_visitor
      create_userable("Visitor")
    end

    resource.save

    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :institution_id, :is_student, :is_professor, :is_judge, :is_committee_member, :is_admin, :is_visitor])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def create_userable(userable_type)
    user_id = resource.id
    case userable_type
    when "Student" 
      major = params[:major] 
      student_code = params[:student_code]
      student = Student.new(major: major, student_code: student_code, user_id: user_id)
      student.save
      return student
    when "Professor"
      department = params[:department]
      professor = Professor.new(department: department, user_id: user_id)
      professor.save
      return professor
    when "CommitteeMember"
      committee_member = CommitteeMember.new(user_id: user_id)
      committee_member.save
      return committee_member
    when "Judge"
      external = params[:external]
      company = params[:company]
      department = params[:judge_department]
      contact_name = params[:contact_name]
      contact_email = params[:contact_email]
      contact_phone = params[:contact_phone]
      has_tablet = params[:has_tablet]
      judge = Judge.new(external: external, contact_phone: contact_phone, company: company, department: department, contact_name: contact_name, contact_email: contact_email, has_tablet: has_tablet, user_id: user_id)
      judge.save
      return judge
    when "Administrator"
      administrator = Administrator.new(user_id: user_id)
      administrator.save
      return administrator
    when "Visitor"
      city = params[:city]
      visitor = Visitor.new(city: city, user_id: user_id)
      visitor.save
      return visitor
    end
  
  end
end
