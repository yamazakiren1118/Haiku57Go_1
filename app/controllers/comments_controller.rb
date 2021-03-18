class CommentsController < ApplicationController
  def show
  end
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:info] = 'コメントを投稿しました'
      redirect_to haiku_path(@comment.haiku_id,haiku_id: @comment.haiku_id)
    else
      flash[:danger] = 'コメントの投稿に失敗'
      redirect_to comment_new_path
    end
  end
end

private
def comment_params
  params.require(:comment).permit(:comment1,:comment2,:comment3,:user_id,:haiku_id)
end