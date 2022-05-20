class AddDataToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birth, :date
    add_column :users, :join_date, :date
    add_column :users, :gender, :integer
  end
end
