class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(profile_params)
    @comment.user = current_user
    x = params[:post_id]
    @comment.post = Post.find(params[:post_id])

    if @comment.save
       redirect_to Post.find(params[:post_id])
    else
      render :new
    end
  end

  private

    def profile_params
      params.require(:comment).permit(:comment)
    end

end
