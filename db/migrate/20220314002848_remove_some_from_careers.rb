class RemoveSomeFromCareers < ActiveRecord::Migration[6.1]
  def change
    remove_column :careers, :firstchoice, :string
    remove_column :careers, :secoundchoice, :string
    remove_column :careers, :careerplan, :text
    remove_column :careers, :opinionToHR, :text
  end
end
