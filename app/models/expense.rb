class Expense < ApplicationRecord
  validates :name, :amount, presence: true
  validates :name, length: { minimum: 8 }
  validates :amount, numericality: { only_integer: false, greater_than: 0 }
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
end
