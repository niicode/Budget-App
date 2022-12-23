# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :money_groups, dependent: :destroy
  has_many :operations, through: :money_groups

  validates :name, presence: true, length: { minimum: 3 }
  validates :icon, presence: true

  def ordered_transactions
    operations.order(created_at: :desc)
  end
end
