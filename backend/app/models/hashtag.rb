class Hashtag < ActiveRecord::Base
  belongs_to :question, through: :question_hashtags
end
