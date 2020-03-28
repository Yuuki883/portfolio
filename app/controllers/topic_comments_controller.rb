class TopicCommentsController < ApplicationController

    def create
        @topic = Topic.find(params[:topic_id])
        @topic_comment = TopicComment.new(topic_comment_params)
        @topic_comment.user_id = current_user.id
        @topic_comment.topic_id = params[:topic_id]
        if @topic_comment.save
            redirect_to topic_path(@topic)
        else
            @topic_comments = TopicComment.where(topic_id: @topic.id)
        end
    end

    def destroy
        @topic_comment = TopicComment.find(params[:topic_id])
        @topic_comment.destroy
        redirect_to request.referer, notice: "コメントを削除しました！"
    end

    private
    def topic_comment_params
        params.require(:topic_comment).permit(:name, :body)
    end
end
