class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.id = current_user.id
    
    if  @review.save
      flash[:notice]="投稿に成功しました！"
      redirect_to review_path(@review)
    else
      @user = current_user
      @reviews = Review.all
      render :index
      
    end
  end

  def index
    @user = current_user
    @review = Review.new
    @reviews = Review.all
  end

  def show
     @review = Review.find(params[:id])
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
    params.require(:review).permit(:nickname, :gender, :hospital, :clinical_department, :pharmacy, :use_count, :address, :age, :visit_month, :cost, :content)
  end
 
end
