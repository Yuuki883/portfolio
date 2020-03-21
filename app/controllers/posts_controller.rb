class PostsController < ApplicationController
    before_action :authenticate_user!,except: [:top]
    before_action :correct_user, only: [:edit, :update]

  def new
    @post = Post.new
    @post.post_images.build
  end

  def index
    @post  = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @favorite = Favorite.new
    # @post_comments = @post.post_comments
    # @post_comment = PostComment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
          redirect_to posts_path, notice: "successfully created post!"
        else
          @posts = Post.all
          render 'index'
        end
      end
    end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "successfully updated Your post!"
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    Post.destroy
    redirect_to posts_path, notice: "successfully delete post!"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :place_name, post_images_images: [])
  end