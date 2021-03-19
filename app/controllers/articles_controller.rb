class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    if @article.update(title: params[:title], content: params[:content])
      flash[:notice] = "Article was updated"
      redirect_to articles_path(@article)
     else
      flash[:notice] = "Article was not updated"
      render 'edit'
     end
  end

  def destroy
    @article = Article.find(params[:id])
  @article.destroy
  flash[:notice] = "Article was deleted"
  redirect_to articles_path
  end
end