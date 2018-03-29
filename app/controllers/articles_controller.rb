class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]
  before_action :find_catalog, only: [:edit, :create, :new, :update]
  before_action :authenticate_user!, except: [:index, :show, :search]

  def search
    if params[:search].present?
      @articles = Article.search(params[:search])
    else
      @articles = Article.all.order("created_at DESC").page(10)
    end
  end

  def profile
    @articles = User.find(params[:id]).articles
  end

  def index
    @articles =
      if params[:catalog].blank?
        Article.friendly.order(:created_at).page(params[:page]).per(10)
      else
        catalog_id = Catalog.find_by(name: params[:catalog]).id
        Article.friendly.where(catalog_id: catalog_id).page(params[:page]).per(10)
      end

    respond_to do |format|
      format.html
      format.json { render json: @articles, only: [:id, :title, :body] }
    end
  end

  def new
    @article = Article.new
  end

  def create
    tmp_article_params = article_params
    tmp_article_params[:user_id] = current_user.id
    @article = Article.create(tmp_article_params)
    redirect_to article_path(@article)
  end

  def show
    @like_article_state = 0
    @article = Article.friendly.find(params[:id])
    @comments = @article.comments.order(:created_at).page(params[:page]).per(5)
    if user_signed_in?
      tmp_articles = current_user.like_articles.where(article_id: @article.id)
      @like_article_state = tmp_articles.first.state unless tmp_articles.empty?
    else

    end
    respond_to do |format|
      format.html
      format.json { render json: [@article, @comments], except: [:created_at, :updated_at] }
    end
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
    params.require(:article).permit(:title, :body, :avatar, :catalog_id, :slug)
  end

  def find_article
    @article = Article.friendly.find(params[:id])
  end

  def find_catalog
    @catalog = Catalog.all.map {|t| [t.name, t.id]}
  end

end
