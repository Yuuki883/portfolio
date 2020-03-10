class Users::UsersController < ApplicationController

def index
   @user = User.find(current_user.id)
end#Ex:- add_index("admin_users", "username")

def show
   @user = User.find(params[:id]) #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
   @posts = @user.posts
   @post = Post.new
end

 def edit
	@user = User.find(params[:id])
end

  end

  private
  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
end
