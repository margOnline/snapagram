class CommentsController < ApplicationController
  before_action :set_snap

  def create
    @comment = @snap.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      create_notification @snap
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end  
    else
      flash[:alert] = "Hmm, comment refused"
      render root_path
    end
  end

  def destroy
    @comment = @snap.comments.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_snap
    @snap = Snap.find(params[:snap_id])
  end

  def create_notification(snap)
    return if snap.user.id == current_user.id
    puts "here"
    n=Notification.create(
      user_id: snap.user.id,
      snap_id: snap.id,
      notified_by_id: current_user.id,
      notice_type: 'comment',
      read: false
    )
    puts "\n\n#{n.errors.full_messages}\n\n"
  end
end
