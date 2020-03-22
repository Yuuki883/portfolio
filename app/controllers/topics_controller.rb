class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def index
    @topic = Topic.new
    @topics = Topic.all
    @topic_comments = @topic.topic_comments
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

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
