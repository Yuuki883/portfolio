class PostsController < ApplicationController

before_action :authenticate_user!,except: [:top]
before_action :correct_user, only: [:edit, :update]

  def new
    @post = Post.new
    @post.post_images.build
    end

  def index
    @posts = Post.all
    end

  def show
    @post = Post.find(params[:id])
    # @favorite = Favorite.new
    # @post_comments = @post.post_comments
    # @post_comment = PostComment.new
    end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
      if @post.save
          redirect_to post_path(@post), notice: "successfully created post!"
      else
          @posts = Post.all
          render 'index'
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(book_params)
      redirect_to book_path(@book.id), notice: "successfully updated book!"
    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    Post.destroy
    redirect_to books_path, notice: "successfully delete book!"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :place_name, post_images_images: [])
  end
end
