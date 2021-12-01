class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }
  validates :icon, attached: true
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :expenses
  has_one_attached :icon

  def total
    count = 0
    expenses.each { |e| count += e.amount }
    count
  end
end
