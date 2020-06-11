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
      userable_type = resource.userable_type
      userable = create_userable(userable_type)
      resource.userable_id = userable.id
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
    devise_parameter_sanitizer.permit(:sign_up, keys: user_keys())
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
    case userable_type
    when "Student"
      major = params[:major]
      student_code = params[:student_code]
      student = Student.new(major: major, student_code: student_code)
      student.save
      return student
    when "Professor"
      department = params[:professor_department]
      professor = Professor.new(department: department)
      professor.save
      return professor
    when "CommitteeMember"
      committee_member = CommitteeMember.new
      committee_member.save
      return committee_member
    when "Operative"
      operative = Operative.new
      operative.save
      return operative
    when "Judge"
      company = params[:company]
      department = params[:judge_department]
      contact_name = params[:contact_name]
      contact_email = params[:contact_email]
      has_tablet = params[:has_tablet]
      judge = Judge.new(company: company, department: department, contact_name: contact_name, contact_email: contact_email, has_tablet: has_tablet)
      judge.save
      return judge
    when "Administrator"
      administrator = Administrator.new
      administrator.save
      return administrator
    end
  end
end
