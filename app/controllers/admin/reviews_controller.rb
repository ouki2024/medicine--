class Admin::ReviewsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @review = Review.new
    @reviews = Review.all
    @reviews = @reviews.page(params[:page])
  end


  def show
    @newreview = Review.new
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
    @user = @review.user
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path(@review), notice: '投稿を削除しました。'
  end
end
