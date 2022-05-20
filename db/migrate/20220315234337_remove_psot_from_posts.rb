class RemovePsotFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :psot22, :text
  end
end
