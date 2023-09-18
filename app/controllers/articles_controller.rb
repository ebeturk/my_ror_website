class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
    
    if params[:category].present? && Article.categories.keys.include?(params[:category])
      @articles = Article.send(params[:category])
    end

    if params[:query].present?
      @articles = Article.search_by_title_and_content_and_summary(params[:query])
    end

    @articles = @articles.order(publication_date: :desc) || @articles.order(created_at: :desc)
  end

  def show
    @comments = @article.comments
    @new_comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully posted.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :category)
  end
end
