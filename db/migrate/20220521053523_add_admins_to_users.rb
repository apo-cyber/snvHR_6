class AddAdminsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin2, :boolean, null: false, default: false
    add_column :users, :admin3, :boolean, null: false, default: false
  end
end
