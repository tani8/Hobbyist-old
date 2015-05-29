class User < ActiveRecord::Base
  has_many :answers
  has_many :questions
  has_and_belongs_to_many :hobbies


end
