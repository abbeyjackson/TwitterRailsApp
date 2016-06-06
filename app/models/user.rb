class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets, dependent: :destroy
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 12 }
end
