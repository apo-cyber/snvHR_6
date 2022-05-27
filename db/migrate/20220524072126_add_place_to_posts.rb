class AddPlaceToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :workplace2, :string
  end
end
