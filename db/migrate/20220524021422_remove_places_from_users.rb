class RemovePlacesFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :workplace2, :string
    remove_column :users, :workplace3, :string
  end
end
