class User < ApplicationRecord
  validates :full_name, presence: true, length: { minimum: 10 }
  has_many :categories, foreign_key: 'author_id'
  has_many :expenses, foreign_key: 'author_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
