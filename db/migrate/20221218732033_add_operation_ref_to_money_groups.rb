# frozen_string_literal: true

class AddOperationRefToMoneyGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :money_groups, :operation, null: false, foreign_key: true
  end
end
