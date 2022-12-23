# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy, foreign_key: 'user_id'
  has_many :operations, dependent: :destroy, foreign_key: 'user_id'

  validates :name, presence: true

  def ordered_groups
    groups.order(created_at: :desc)
  end
end
