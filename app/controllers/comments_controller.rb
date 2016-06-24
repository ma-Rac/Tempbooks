class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(profile_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:id])

    if @comment.save
       redirect_to Post.find(params[:id])
    else
      render :new
    end
  end
end
