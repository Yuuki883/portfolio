class TopicCommentsController < ApplicationController

    def create
        @topic = Topic.find(params[:topic_id])
        @topic_comment = TopicComment.new(topic_comment_params)
        @topic_comment.topic_id = params[:topic_id]
        if @topic_comment.save
            flash[:success] = "Comment was successfully created."
            redirect_to topic_path(@topic)
        else
            @topic_comments = TopicComment.where(topic_id: @topic.id)
        end
    end

    def destroy
        @topic_comment = TopicComment.find(params[:topic_id])
        @topic_comment.destroy

        redirect_back(fallback_location: root_path)
    end
        private
    def topic_comment_params
        params.require(:topic_comment).permit(:name, :body)
    end
end
