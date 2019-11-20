class ArticlesController < ApplicationController
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end


  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end
   
  post '/articles/?' do
    @article = Article.create(:title => params[:title], :content => params[:content])
    redirect "/articles/#{@article.id}"
  end


  get '/articles/:id/edit' do  #load edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
  end
 
  patch '/articles/:id' do #edit action
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do #delete action
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect '/articles'
  end
end