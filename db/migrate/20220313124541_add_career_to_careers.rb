class AddCareerToCareers < ActiveRecord::Migration[6.1]
  def change
    add_column :careers, :career1, :text
    add_column :careers, :career2, :text
    add_column :careers, :career3, :text
    add_column :careers, :career4, :text
    add_column :careers, :career5, :text
    add_column :careers, :career6, :text
    add_column :careers, :career7, :text
    add_column :careers, :career8, :text
    add_column :careers, :career9, :text
  end
end
