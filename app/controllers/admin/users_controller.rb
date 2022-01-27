class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).reverse_order
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました。"
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = "更新が失敗しました。"
      redirect_to admin_user_path(@user)
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "削除しました。"
      redirect_to admin_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :is_deleted)
  end
  
end
