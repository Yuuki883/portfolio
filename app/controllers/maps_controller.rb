class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]


  def index
    @map = Map.new
    @maps = Map.all.where(user_id: current_user.id).order(created_at: :desc)
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow map.name
    end
  end

  def edit
  end

  def create
    @map = Map.new(map_params)
    @map.user_id = current_user.id
    respond_to do |format|
      if @map.save
        format.html { redirect_to maps_path, notice: 'スポットを登録しました！' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to maps_path, notice: 'スポットを更新しました!' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'スポットを削除しました！' }
      format.json { head :no_content }
    end
  end

  private
  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params.require(:map).permit(:name, :description, :latitude, :longitude)
  end

  def correct_user
    map = Map.find(params[:id])
    if current_user.id != map.user.id
      redirect_to user_path(current_user)
    end
  end
end
