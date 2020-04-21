class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(12).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10).order(created_at: :desc)
    @maps = Map.all.where(user_id: @user.id)
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow map.name
    end
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
      redirect_to edit_user_path(@user.id), notice: "プロフィールを更新しました！"
    else
      render "edit"
    end
    if params[:delete_image]
      #削除ボタンが押されたらnil
      @user.image = nil
      @user.save!
      redirect_to user_path(@user), notice: "プロフィール画像を削除しました!"
    end
  end

  def following
    user = User.find(params[:user_id])
    @users = user.following_user
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.follower_user
  end

  def topics
    @topics = Topic.all.where(user_id: current_user.id).page(params[:page]).per(10).order(created_at: :desc)
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :image, :like_busho, :like_age)
    end

    def baria_user
      unless params[:id].to_i == current_user.id
        redirect_to new_user_session_path
      end
    end
end
