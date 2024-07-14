class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    # @users = User.all
    #kaminari導入
    # @reviews = @users.page(params[:page])
    @users = User.page(params[:page])
    @user = User.first
    @reviews = @user.reviews.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page])
    @review = Review.new

  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました。'
  end


end
