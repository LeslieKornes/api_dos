class ArticlesController < ApplicationController
  
  def index
    articles = Article.all
    # status code unecessary but explicit
    render json: serializer.new(articles), status: :ok
  end

  def serializer
    ArticleSerializer
  end
end
