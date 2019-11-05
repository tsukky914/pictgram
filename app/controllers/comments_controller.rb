class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    # binding.pry
    if @comment.save
      redirect_to topics_path, success: "コメントに成功しました！"
    else
      flash.now[:danger] = 'コメントに失敗しました><'
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end

