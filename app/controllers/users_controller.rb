class UsersController < ApplicationController
  # deviseのヘルパーメソッド
  before_action :authenticate_user!,except: [:show]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(@user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  # 退会確認画面
  def unsubscribe
    @user = current_user
  end

  # 退会
  def withdraw
    @user = current_user
    if @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
      flash[:notice] = "退会しました"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name)
  end
 
end
