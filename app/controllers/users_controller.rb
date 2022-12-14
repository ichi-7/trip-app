class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).page(params[:page]).per(4).order('id DESC')
    @entries = PlanMember.where(user_id: @user.id).page(params[:page]).per(4).order('id DESC')
  end
  
  def edit
    @user = User.find(params[:id])
    # 本人でないと編集ページに行けない
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to users_path
    end
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end
  
end
