class AddElmToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post22, :text
  end
end
