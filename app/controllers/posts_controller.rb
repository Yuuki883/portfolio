class PostsController < ApplicationController

before_action :authenticate_user!,except: [:top]
before_action :correct_user, only: [:edit, :update]

    def new
    @post = Post.new
    end

    def index
    @posts = Post.all #一覧表示するためにBookモデルの情報を全てくださいのall
    end

  def show
    @post = Post.find(params[:id])
    # @booknew = Book.new
    @favorite = Favorite.new
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
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
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to book_path(@book.id), notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private
  def book_params
  	params.require(:post).permit(:title, :content)
  end

  def correct_user
  book = Book.find(params[:id])
  if current_user.id != book.user.id
    redirect_to books_path
  end
  end
end
