class RemoveChoicFromCareers < ActiveRecord::Migration[6.1]
  def change
    remove_column :careers, :firstchoic, :string
  end
end
