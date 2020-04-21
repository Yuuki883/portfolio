class TopicsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  before_action :correct_user, only: [:edit, :update]
  def new
    @topic = Topic.new
  end

  def index
    @topic = Topic.new
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true).page(params[:page]).per(10).order(created_at: :desc)
    @topic_comments = @topic.topic_comments
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comment = TopicComment.new
    @topic_comments = @topic.topic_comments
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to edit_topic_path(@topic.id), notice: "掲示板を作成しました！"
    else
      render "new"
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to edit_topic_path(@topic.id), notice: "掲示板のタイトルを更新しました！"
    else
      render "edit"
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to topics_path, notice: "掲示板を削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
  def correct_user
    topic = Topic.find(params[:id])
    if current_user.id != topic.user.id
      redirect_to topics_path
    end
  end
end
