class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @rooms = Room.all
        @user = @current_user
        @currentEntries = current_user.entries
            myRoomIds = []
        @currentEntries.each do |entry|
            myRoomIds << entry.room.id
        end
        @anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?', @current_user.id)
    end

    def show
        @room = Room.find(params[:id])
        if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
            @message = Message.new
            @messages = @room.messages
            @entries = @room.entries
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def create
        @room = Room.create
        @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
        @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
        redirect_to "/rooms/#{@room.id}"
    end

    def destroy
        room = Room.find(params[:id])
        room.destroy
        redirect_to rooms_path, notice: "チャットルームを削除しました!"
    end
end
