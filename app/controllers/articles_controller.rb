class ArticlesController < ApplicationController
  skip_before_action :login_required

  def index
    @articles = Article.order(id: :desc).first(3)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def portal
    @fiscal_year=fiscal_year.to_s
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
