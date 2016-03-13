class SnapsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_snap, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_snap, only: [:edit, :update, :destroy]

  def index
    @snaps = Snap.all
  end

  def show
  end

  def new
    @snap = current_user.snaps.build
  end

  def create
    @snap = current_user.snaps.build(snap_params)
    if @snap.save
      flash[:success] = "Your snap has been uploaded"
      redirect_to snaps_path
    else
      flash[:alert] = "Please correct the following errors"
      render :new
    end
  end

  def edit
  end

  def update
    if @snap.update(snap_params)
      flash[:success] = "Your snap has been updated"
      redirect_to snap_path(@snap)
    else
      flash[:alert] = "Please correct the following errors"
      render :edit
    end
  end

  def destroy
    @snap.destroy
    redirect_to root_path
  end

  def like
    if current_user.voted_up_on? @snap
      flash[:alert] = "You can only like a snap once."
    elsif current_user == @snap.user
      flash[:alert] = "You can't like your own snap. Harsh, I know."
    else
      @snap.liked_by(current_user)
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end  
    end
  end

  private
  def snap_params
    params.require(:snap).permit(:caption, :image, :user_id)
  end

  def set_snap
    @snap = Snap.find(params[:id])
  end

  def owned_snap
    unless current_user == @snap.user
      flash[:alert] = "You can only update your own snaps!"
      redirect_to root_path
    end
  end
end
