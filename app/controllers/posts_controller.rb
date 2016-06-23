class PostsController < ApplicationController
  def index
    @posts  = Post.all
  end

  def show
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(profile_params)
    @post.user = current_user

    if @post.save
      redirect_to action: :show, notice: "Success!!1"
    else
      render :new
    end
  end

  def destroy
  end

  private

    def profile_params
      params.require(:post).permit(:title, :image, :description, :user_id)
    end
end

# @posts = Post.new
# @posts.user_id = current_user.id
