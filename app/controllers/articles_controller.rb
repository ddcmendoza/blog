class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def edit
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.content = params[:content]

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end