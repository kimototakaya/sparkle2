class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true
  validates :password, confirmation: true
  validates :email, uniqueness: true
  has_many :posts
  # validates :name, presence: true, uniqueness: true
  
end