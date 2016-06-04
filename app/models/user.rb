class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 12 }

end
