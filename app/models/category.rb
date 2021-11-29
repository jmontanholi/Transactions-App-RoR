class Category < ApplicationRecord
  validates :name, :icon, presence: true, length: { minimum: 4 }
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :expenses
end
