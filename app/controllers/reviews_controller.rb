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
      flash.now[:alert] = "投稿フォームをすべて入力してください"
      render :new
    end
  end

  def index
    @user = current_user
    @review = Review.new
    @reviews = Review.all
  end

  def show
    @newreview = Review.new
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user == current_user
      render :edit
      return
    else
      redirect_to reviews_path
    end
  end
  
  def update
    @review = Review.find(params[:id])
    @review.user_id = current_user.id
    
    if @review.update(review_params)
      flash[:notice]="更新に成功しました！"
      redirect_to mypage_path
    else 
      flash.now[:alert]="更新に失敗しました！"
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice]="投稿を削除しました"
      redirect_to mypage_path
    end
  end
  
  # 投稿データのストロングパラメータ
  private

  def review_params
    params.require(:review).permit(:nickname, :gender, :hospital, :clinical_department, :pharmacy, :use_count, :address, :age, :visit_month, :cost, :content)
  end
 
end
