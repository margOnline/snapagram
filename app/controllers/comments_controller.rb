class CommentsController < ApplicationController
  before_action :set_snap

  def create
    @comment = @snap.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Thanks for your comment"
      redirect_to :back
    else
      flash[:alert] = "Hmm, comment refused"
      render root_path
    end
  end

  def destroy
    @comment = @snap.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_snap
    @snap = Snap.find(params[:snap_id])
  end
end
