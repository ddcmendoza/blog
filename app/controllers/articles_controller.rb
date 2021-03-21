class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end
  def show
    @article = Article.find(params[:id])
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
    if @article.title != "" or @article.content != ""
      if @article.save
        redirect_to articles_path
      else
        render :new
      end
    else
      redirect_to new_article_path
      flash[:alert] = "Can't publish empty article"
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(title: params[:title], content: params[:content])
      flash[:notice] = "Article was updated"
      redirect_to articles_path(@article)
     else
      flash[:alert] = "Article was not updated"
      render 'edit'
     end
  end

  def destroy
    @article = Article.find(params[:id])
  @article.destroy
  flash[:warning] = "Article was deleted"
  redirect_to articles_path
  end
end