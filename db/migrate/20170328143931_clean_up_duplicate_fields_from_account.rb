class CleanUpDuplicateFieldsFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :first_name
    remove_column :accounts, :last_name
    remove_column :accounts, :artist
  end
end
