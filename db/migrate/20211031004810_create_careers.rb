class CreateCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :careers do |t|
      t.string :firstchoice
      t.string :secoundchoice
      t.string :name
      t.string :workplace
      t.text :careerplan
      t.text :opinionToHR

      t.timestamps
    end
  end
end
