class QuestionHashtag < ActiveRecord::Base
  belongs_to :question
  belongs_to :hashtag
end
