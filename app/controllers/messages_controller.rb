class MessagesController < ApplicationController
    before_action :authenticate_user!, :only => [:create]

    def create
        if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
            @message = Message.create(message_params.merge(:user_id => current_user.id))
            redirect_to "/rooms/#{@message.room_id}"
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @message = Message.find(params[:id][:user_id][:room_id])
        room=room.find_by_id(params[:room])
        @message.destroy
        # message = Message.find(message_params.merge(:user_id => current_user.id))
        message.destroy
    end

    private
    def message_params
        params.require(:message).permit(:user_id, :content, :room_id)
    end
end