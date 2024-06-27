class ReviewsController < ApplicationController
  
  # def search
  #   @review = Review.search(params[:keyword])
    
  # end
  
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    # @review = current_user.reviews.build(review_params)
    
    tag_list = params[:review][:tag_ids].split(',')
    
    if  @review.save
      @review.save_tags(tag_list)
      flash[:notice]="投稿に成功しました！"
      redirect_to reviews_path
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
    @reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviews : Review.all
    @reviews = Review.page(params[:page])
  end

  def show
    @newreview = Review.new
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
    @user = @review.user
  end

  def edit
    @review = Review.find(params[:id])
    @tag_list =@review.tags.pluck(:name).join(",")
    
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
    tag_list = params[:review][:tag_ids].split(',')
    
    if @review.update(review_params)
      @review.save_tags(tag_list)
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
    params.require(:review).permit(:nickname, :gender, :hospital, :clinical_department, :pharmacy, :use_count, :address, :age, :visit_month, :cost, :content, :tag_ids: [])
  end
 
end
