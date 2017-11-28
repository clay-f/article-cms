class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :find_catalog, only: [:edit, :create, :new, :update]
  before_action :authenticate_user!, except: [:index, :show, :search]

  def search
    if params[:search].present?
      @articles = Article.search(params[:search])
    else
      @articles = Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def index
    @articles = 
      if params[:catalog].blank?
        Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
      else
        catalog_id = Catalog.find_by(name: params[:catalog]).id
        Article.where(catalog_id: catalog_id).paginate(page: params[:page], per_page: 10)
      end

      respond_to do |format|
        format.html
        format.json { render json: @articles, only: [:id, :title, :body]}
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
    @comments = @article.comments.order("created_at desc").paginate(:page => params[:page], per_page: 4)

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
    params.require(:article).permit(:title, :body, :avatar, :catalog_id)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def find_catalog
    @catalog = Catalog.all.map {|t| [t.name, t.id]}
  end

end
