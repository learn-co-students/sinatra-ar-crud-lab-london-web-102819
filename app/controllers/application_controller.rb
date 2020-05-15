
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #first_page
  get '/?' do
    redirect to '/articles'
  end

  #index
  get '/articles' do
    @articles=Article.all
    erb :index 
  end

  
  #new
  get '/articles/new'do
    @article = Article.new
    erb :new 
  end

  #show
  get '/articles/:id' do
    @article=Article.find("#{params[:id]}")
    erb :show
  end

  #create a new instance of article with the params hash created based on the value of the input fields in the form the user submitted. 
  post '/articles' do
    @article=Article.create(title: params[:title], content: params[:content])
    # binding.pry
    redirect to  "/articles/#{@article.id}"
  end 

  #edit
  get '/articles/:id/edit' do
    @article = Article.find("#{params[:id]}")

    erb :edit
  end

  #update with patch
  patch '/articles/:id' do
     @article=Article.find(params[:id])
     @article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  #destroy
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
