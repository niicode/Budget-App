class Operation < ApplicationRecord
  belongs_to :user
  has_many :money_groups, dependent: :destroy
  has_many :groups, through: :money_groups

  validates :name, presence: true, length: { minimum: 3 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
