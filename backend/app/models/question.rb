class Question < ActiveRecord::Base
  belongs_to :hobby
  belongs_to :user
  has_many :answers
  # has_many :hashtags, through: :hashtags_questions
  has_and_belongs_to_many :hashtags

  validates_presence_of :title, :body, :hobby_id, :user_id
end
