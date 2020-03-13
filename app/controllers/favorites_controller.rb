class FavoritesController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @favorite = current_user.favorites.create(post_id: params[:post_id])
        favorite.save
    end

    def destroy
        @post = Post.find(params[:post_id])
        favorite = current_user.favorites.find_by(post_id: @post.id)
        favorite.destroy
    end

#     private
#     def redirect
#         case params[:redirect_id].to_i
#         when 0
#         redirect_to posts_path
#         when 1
#         redirect_to post_path(@post)
#         end
#     end
end
