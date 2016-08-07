class UserMailer < ApplicationMailer
  def answer_notification(question, user)
    @question = question
    @user = user
    @url = "http://unlock-n-ror.herokuapp.com/question/" + @question.id.to_s
    mail(to: @user.email, subject: "Someone answered to your question!")
    puts "Sending mail"
  end

  def comment_notification(commentable, user)
    @commentable = commentable
    @user = user
    @url = "http://unlock-n-ror.herokuapp.com/question/" + get_question_id(@commentable).to_s
    mail(to: @user.email, subject: "Someone commented to your question/answer!")
  end

  private
    def get_question_id(commentable)
      commentable.class.name == "Question" ? commentable.id : commentable.question.id
    end
end
