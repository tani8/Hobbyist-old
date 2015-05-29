class Hobby < ActiveRecord::Base
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
end
