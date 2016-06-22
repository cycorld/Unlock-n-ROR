class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :set_question, only: [:edit, :show, :destroy, :update]  

  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @question.update
      redirect_to @question
    else
      render :edit
    end
  end

  def detroy
    @question.destroy
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description, :tag_list)
    end
end
