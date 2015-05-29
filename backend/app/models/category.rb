class Category < ActiveRecord::Base
  has_many :hobbies

  validates_presence_of :name
end
