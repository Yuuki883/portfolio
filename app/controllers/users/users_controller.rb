class Users::UsersController < ApplicationController

   def index
      @user = User.find(current_user.id)
   end

   def show
      @user = User.find(params[:id])
      @posts = @user.posts
      @post = Post.new
   end

   def edit
      @user = User.find(params[:id])
   end

   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id), notice: "successfully updated your profile!"
      else
         render "edit"
      end
   end

   private
   def user_params
      params.require(:user).permit(:name, :introduction, :image, :like_busho, :like_age)
   end

   def baria_user
      unless params[:id].to_i == current_user.id
         redirect_to user_path(current_user)
      end
   end
end
