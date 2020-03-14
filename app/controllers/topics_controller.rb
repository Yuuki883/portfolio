class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comment = TopicComment.new
    @topic_comments = @topic.topic_comments
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to topics_index_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_index_path
  end
end
  private
    def topic_params
      params.require(:topic).permit(:title)
    end
