class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    
    if  @review.save
      flash[:notice]="投稿に成功しました！"
      redirect_to mypage_path(@user)
    else
      @user = current_user
      @reviews = Review.all
      flash[:alert] = @review.errors.full_messages.join(", ")
      render :index
      
    end
  end

  def index
    @user = current_user
    @review = Review.new
    @reviews = Review.all
  end

  def show
    @review = current_user
    
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
