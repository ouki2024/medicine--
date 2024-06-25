class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :update]
  
  def show
    @user = current_user
    @review = Review.new
    # @reviews = Review.where(user_id: @user.id)
    @reviews = @user.reviews.page(params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
      return
    end
    redirect_to user_path(current_user)
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:notice]="プロフィールの編集に成功しました！"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit   
    end
  end
  
  
  private
  def user_params
        
  params.require(:user).permit(:nickname, :profile_image, :introduction)  
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
    
end
