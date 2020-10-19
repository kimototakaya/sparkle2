class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user, foreign_key: 'user_id'
  has_many :comments
end
