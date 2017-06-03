class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :find_catalog, only: [:edit, :create, :new]
  before_action :authenticate_user!, except: [:index, :show]

  def search
    if params[:search].present?
      @articles = Article.search(params[:search])
    else
      @articles = Article.all.order("created_at DESC")
    end
  end

  def index
    if params[:catalog].blank?
      @articles = Article.all.order("created_at DESC")
    else
      @catalog_id = Catalog.find_by(name: params[:catalog]).id
      @articles = Article.where(catalog_id: @catalog_id)
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
  end

  def edit

  end

  def update
    @article.update(article_params)
    if @article.save
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :user_id, :avatar, :catalog_id)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def find_catalog
    @catalog = Catalog.all.map { |t| [t.name, t.id] }
  end
end
