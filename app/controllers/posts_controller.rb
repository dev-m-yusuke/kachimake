class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only:[:edit, :show, :update, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice:'投稿できました。'
    else
      render :new, alert:'投稿できませんでした。'
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:'投稿を更新出来ました。'
    else  
      render :edit  
    end
  end
  
  def destroy
    if @post.destroy
      redirect_to posts_path, notice:'投稿を削除出来ました。'
    else  
      redirect_to posts_path, alert:'投稿を削除出来ました。'
    end
  end
  
  
  private
  def find_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(
      :content,images: []
      )
  end
end
