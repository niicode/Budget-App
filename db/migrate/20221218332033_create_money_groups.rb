class CreateMoneyGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :money_groups, &:timestamps
  end
end
