class CommentsController < ApplicationController
  before_action :get_virtual_sample
  before_action :set_comment, only: [:destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @virtual_sample.comments.order(created_at: :desc)
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @virtual_sample.comments.new(comment_params)
    @comment.user_name = current_user.first_name + " " +current_user.last_name
    @comment.user_type = "VISITANTE"
    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_virtual_sample_path, notice: 'Comment was succesfully posted' }
        format.json { render :show, status: :created, location: @virtual_sample }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @virtual_sample.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.destroy

      redirect_to project_virtual_sample_path(@virtual_sample)
    else
      render json: { errors: { comment: ['not owned by user'] } }, status: :forbidden
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def get_virtual_sample
      @project = Project.find(params[:project_id])
      @virtual_sample = @project.virtual_sample
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_name, :user_type)
    end
end
