class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]
  
  def new
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :back
    end
  end

  def edit

  end
  
  def update
    if @comment.update(comment_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end

    def verify_user
      redirect_to :back unless current_user.id == @comment.user_id
    end
    
    def comment_params
      params.require(:comment).permit(:content,:answer_id,:question_id)
    end
end
