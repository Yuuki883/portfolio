class FavoritesController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @favorite = current_user.favorites.create(post_id: params[:post_id])
    end

    def destroy
        @post = Post.find(params[:post_id])
        @favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
        @favorite.destroy
    end
end
