class AddHrColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :HR, :boolean, null: false, default: false
  end
end
