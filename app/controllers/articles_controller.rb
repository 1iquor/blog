class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
  @articles = Article.all #извлечение всех статей из базы данных
  end
   def show
    @article = Article.find(params[:id]) #вывод статьи с определенным id
  end
   def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params) #создает новый экземпляр статьи 

    if @article.save
      redirect_to @article #перенаправление браузера на страницу статьи (заставит браузер выполнить новый запрос)
    else
      render :new, status: :unprocessable_entity #повторно отображает форму (отображает указанное представление)
    end
  end
def edit
    @article = Article.find(params[:id]) #извлекает статью из бд и сохраняет в @article
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
   def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
