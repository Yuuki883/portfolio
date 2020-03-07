class Users::UsersController < ApplicationController

def index
   @user = User.find(current_user.id)
end#Ex:- add_index("admin_users", "username")
 def show
 end

  def edit

  end

  private
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end
end