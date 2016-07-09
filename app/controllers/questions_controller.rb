class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update, :upvote, :downvote]
  before_action :set_question, only: [:edit, :show, :update, :destroy, :upvote, :downvote]
  before_action :verify_user, only: [:edit, :destroy, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def show
    @answer = @question.answers.build
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end


  def upvote
    @question.upvote_by current_user
    redirect_to @question
  end

  def downvote
    @question.downvote_by current_user
    redirect_to @question
  end

  
  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content, :tag_list)
    end

    def verify_user
      redirect_to @question unless @question.user_id == current_user.id
    end
end
