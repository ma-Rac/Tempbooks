class PostsController < ApplicationController
  def index
    @friends = current_user.friend_ids
    @posts  = Post.where(user_id: @friends)
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to action: :show, notice: "Succes!!"
    else
      render :edit
    end
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
