class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update, :upvote, :downvote, :favorite, :unfavorite]
  before_action :set_question, only: [:edit, :show, :update, :destroy, :upvote, :downvote, :favorite, :unfavorite]
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
      SlackBot.push(@question) if Rails.env.production?
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def show
    @answer = @question.answers.build

    @commentable = @question
    @comment = Comment.new

    @accepted_id =
      (acceptation = Acceptation.find_by(question_id: @question.id)).present? \
      ? acceptation.answer_id : nil 
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

  def favorite
    @question.favorited_by current_user
    redirect_to @question
  end

  def unfavorite
    @question.unfavorited_by current_user
    redirect_to @question
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
