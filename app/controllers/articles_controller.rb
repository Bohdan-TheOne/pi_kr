class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  skip_before_action :verify_authenticity_token

  def index
    authorize Article
    @article = Article.new
    @articles = Article.public_ar.ordered.include_author
  end

  def private_articles
    authorize Article
    
    @articles = current_user.admin? ? Article.all : current_user.articles
    @articles = @articles.private_ar.ordered.include_author
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
    authorize Article 
  end

  def create
    authorize Article

    @article = Article.new(article_params)

    @article.author = current_user

    if @article.save
      redirect_to @article
      @notice = "Post was created successfuly"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    if @article.update(article_params)
      redirect_to @article
      @notice = "Post was edited successfuly"
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    authorize @article

    @article.destroy
    @notice = "Post was deleted successfuly"
    redirect_to root_path
  end

private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end
