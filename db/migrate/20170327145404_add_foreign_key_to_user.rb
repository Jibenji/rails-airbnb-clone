class AddForeignKeyToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :account, index: true
  end
end
