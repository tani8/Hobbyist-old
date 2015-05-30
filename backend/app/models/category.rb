class Category < ActiveRecord::Base
  has_many :hobbies

  validates_presence_of :name

  def to_builder
    Jbuilder.new do |category|
      category.(self, :name)
    end
  end

end
