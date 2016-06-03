class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user, :body, :title, presence: true
end
