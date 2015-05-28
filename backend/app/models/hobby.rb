class Hobby < ActiveRecord::Base
  belongs_to :category
  has_many :questions
  has_many :users, through: :user_hobbies
end
