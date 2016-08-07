class User < ApplicationRecord
  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      password: Devise.friendly_token
    }

    create(attributes)
  end

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  has_many :answers
  has_many :questions, dependent: :destroy
  has_many :favorites
  has_many :chatrooms
  has_many :messages
  has_many :scores
  
  acts_as_voter
  acts_as_tagger

  validates_presence_of   :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of     :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: Devise.password_length, allow_blank: true

  def email_required?
    true
  end

  def passworkd_required?
    true
  end
  
  def accepted_answers
    scores.select {|x| x.scorable_type == "Acceptation" }.map do |y|
      {
        question: (a=Acceptation.find y.scorable_id).question,
        content: a.answer.content
      }
    end
  end
  
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
end
