class CommentsController < ApplicationController
  before_action :set_comment, only: [:new, :create, :update, :destroy]

  def new
    @comment = @commentable.comments.build
  end
  
  def create
    @comment = Comment.new(comment_params)
    
    @comment.user_id = current_user.id
    @comment.commentable_id = @commentable.id
    @comment.commentable_type = @commentable.class.name

    @comment.save
    
    redirect_to @question
  end

  def edit

  end
  
  def update
    if @comment.update(comment_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_comment
      @question = Question.find(params[:question_id])
      if params[:answer_id].nil?
        @commentable = @question
      else
        @commentable = Answer.find(params[:answer_id])
      end
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
