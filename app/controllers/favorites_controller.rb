class FavoritesController < ApplicationController
  def index
    @favorite_posts = current_user.favorite_posts
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.post_id = params[:post_id]

    if favorite.save
      redirect_to posts_path, success: 'いいねしました。'
    else
      redirect_to posts_path, danger: 'いいね失敗しました'
    end
  end
end
