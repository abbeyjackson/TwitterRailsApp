class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  validates :email, :password, presence: true
end
