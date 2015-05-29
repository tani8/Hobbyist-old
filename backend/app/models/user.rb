class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :answers
  has_many :questions
  has_and_belongs_to_many :hobbies

  validates :username, presence: true
  validates :email, presence: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  after_create :update_access_token!

  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end
end
