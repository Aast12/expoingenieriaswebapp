class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @params = params[:q]
    fix_filter_params
    @q = User.ransack(@params)
    @users = @q.result
    # TODO: Make pending_approval to be filter with ransack
    @users = @users.reject { |user| !user.committee_member_pending_approval? } if @pending_approval
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      @params = params.require(:user).permit(
        :first_name, :last_name, :is_committee_member, :department, :institution_id, :edition_id
      )
      get_roles(params)
      if save_user
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(user_keys())
  end

  def save_user
    ActiveRecord::Base.transaction do
      @user.update(@params)
      @professor.save if @professor
      @judge.save if @judge
      @committee_member.save if @committee_member

      return true
    end
    rescue ActiveRecord::RecordInvalid
      return false
  end

  def get_approveed_param(params)
    return if params[:user][:approved] != "1"

    @judge = @user.judges.first
    @judge.approved = true if @judge.present?

    @professor = @user.professors.first
    @professor.approved = true if @professor.present?
  end

  def get_committee_member
    @committee_member = @user.committee_members.first

    if @params[:is_committee_member] == "1"
      if @committee_member.present?
        @committee_member.active = true
      else
        @committee_member = CommitteeMember.new(user_id: @user.id)
      end

      return
    end

    @committee_member.active = false if @committee_member.present?
  end

  def get_roles(params)
    get_approveed_param(params)
    get_committee_member
  end

  def fix_filter_params
    if @params
      # TODO: Make pending_approval to be filter with ransack 
      @pending_approval = @params[:is_staff_member_null] == "1"
      @params.delete(:is_staff_member_null)
      @params.delete(:is_student_true) if @params[:is_student_true] == "0"
      @params.delete(:is_professor_true) if @params[:is_professor_true] == "0"
      @params.delete(:is_committee_member_true) if @params[:is_committee_member_true] == "0"
      @params.delete(:is_judge_true) if @params[:is_judge_true] == "0"
      @params.delete(:is_admin_true) if @params[:is_admin_true] == "0"
      @params.delete(:is_visitor_true) if @params[:is_visitor_true] == "0"
      @params.delete(:is_staff_member_true) if @params[:is_staff_member_true] == "0"
    end
  end
end
