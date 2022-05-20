class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index

    if current_user.root == true or current_user.HR == true
      @user = User.all.where(retired: false, root: false).pluck(:id)
      @q = Post.all.where(user_id: @user).ransack(params[:q])
    else
      @q=current_user.posts.ransack(params[:q])
    end
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.csv { send_data @posts.generate_csv, filename: "posts-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end

    @fiscal_year=fiscal_year
  end

  def show
  end

  def shows
    t= Time.new
    if(1 <= t.month and t.month <= 3)
      fis_start=(t.year-1).to_s+'/4/1'
      fis_end=(t.year).to_s+'/3/31'
    else
      fis_start=(t.year).to_s+'/4/1'
      fis_end=(t.year+1).to_s+'/3/31'
    end

    @user = User.all.where(retired: false).where(created_at: fis_start..fis_end).pluck(:id)
    @q = Post.all.where(user_id: @user).ransack(params[:q])
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(5)

    @fiscal_year=fiscal_year.to_s
  end


  def new
    @post = Post.new
    @fiscal_year=fiscal_year.to_s
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: "申告を登録しました。"
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: '申告を編集しました!'
    else
      flash[:alert]= 'Save error!'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "「#{@post.name}」を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(Post.column_names.map{|c| c.to_sym})
  end

  def set_post
    if current_user.root == true
      @post=Post.find(params[:id])
    else
      @post = current_user.posts.find(params[:id])
    end
  end
true
end
