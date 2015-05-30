class Hobby < ActiveRecord::Base
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users

  validates_presence_of :name, :description, :image_url, :category_id
  validates_uniqueness_of :name

  def to_builder
    Jbuilder.new do |hobby|
      hobby.name name
      hobby.description description
      hobby.image_url image
      hobby.category_id category.to_builder
    end
  end
end
