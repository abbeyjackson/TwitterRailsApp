class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user, :body, :title, presence: true
  validates :body, length: { maximum: 140 }
  validates :title, length: { maximum: 40 }

end
