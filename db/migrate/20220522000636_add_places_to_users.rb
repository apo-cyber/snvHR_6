class AddPlacesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :workplace2, :string
    add_column :users, :workplace3, :string
  end
end
