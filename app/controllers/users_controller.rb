class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :baria_user, only: [:edit, :update]

   def index
      @user = User.find(current_user.id)
   end

   def show
      @user = User.find(params[:id])
      @posts = @user.posts
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      if @user.id == current_user.id
      else
         @currentUserEntry.each do |cu|
            @userEntry.each do |u|
               if cu.room_id == u.room_id then
                  @isRoom = true
                  @roomId = cu.room_id
               end
            end
         end
         if @isRoom
         else
            @room = Room.new
            @entry = Entry.new
         end
      end
   end

   def edit
      @user = User.find(params[:id])
      if @user != current_user
         redirect_to user_path(current_user)
      end
   end

   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id), notice: "successfully updated your profile!"
      else
         render "edit"
      end
   end

   def follows

   end

   def followers

   end

   private
   def user_params
      params.require(:user).permit(:name, :introduction, :image, :like_busho, :like_age)
   end

   def baria_user
      unless params[:id].to_i == current_user.id
         redirect_to root_path
      end
   end
end
