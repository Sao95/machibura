class UsersController < ApplicationController
  # deviseのヘルパーメソッド
  before_action :authenticate_user!,except: [:index, :show]

  def index
    redirect_to new_user_registration_path
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to edit_user_path(@user), flash: { error: @user.errors.full_messages }
    end
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
      flash[:withdraw] = "退会しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
