require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    @post.update(name:params[:name], content:params[:content])
    # @post.save
    erb :show
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  delete '/models/:id/delete' do
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :deleted
  end

  get '/show' do
    # binding.pry
    @post = Post.all.first
    erb :show
  end

  get '/' do
    # binding.pry
    @posts = Post.all
    erb :index
  end


end
