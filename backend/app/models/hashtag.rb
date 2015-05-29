class Hashtag < ActiveRecord::Base
  # belongs_to :question, through: :hashtags_questions
  has_and_belongs_to_many :questions
end
