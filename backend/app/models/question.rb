class Question < ActiveRecord::Base
  belongs_to :hobby
  belongs_to :user
  has_many :answers
  has_many :hashtags, through: :question_hashtags
end
