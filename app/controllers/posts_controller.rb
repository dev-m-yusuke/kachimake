class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only:[:edit, :show, :update, :destroy]
  
  def index
    @posts = Post.all.limit(10).order(created_at: :desc)
    @posts = Post.all.includes(:favorite_users)
  end
  
  def new
    return redirect_to new_profile_path, alert:'投稿するには、プロフィール登録が必要です。' if current_user.profile.blank?
    @post = Post.new
  end
  
  def show
    
  end
  
  def edit

  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice:'投稿できました。'
    else
      render :new
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
      :title,:content,images: []
      )
  end
end
