class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    flash[:notice]="投稿に成功しました！"
    redirect_to review_path
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def update
    
  end

  def destroy
    
  end
  
  # 投稿データのストロングパラメータ
  private

  def review_params
    params.require(:review).permit(:gender, :hospital, :clinical_department, :pharmacy, :use_count, :adress, :age, :visit_month, :cost, :content)
  end
 
end
