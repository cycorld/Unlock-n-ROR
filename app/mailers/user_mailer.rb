class UserMailer < ApplicationMailer
  default :from => "dickylee0919@gmail.com"  
  
  def answer_notification(question, user)
    @question = question
    @user = user
    @url = "http://unlock-n-ror.herokuapp.com/question/" + @question.id
    mail(to: @user.email, subject: "Someone answered to your question!")
  end

  def comment_notification(commentable, user)

  end
end
