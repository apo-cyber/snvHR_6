class AddPlaceToCareers < ActiveRecord::Migration[6.1]
  def change
    add_column :careers, :workplace2, :string
  end
end
