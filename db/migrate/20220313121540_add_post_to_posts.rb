class AddPostToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post21, :text
    add_column :posts, :psot22, :text
  end
end
