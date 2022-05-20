class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :idnumber
      t.string :name
      t.string :image
      t.string :workplace
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :retired, null: false, default: false
      t.boolean :admin, null: false, default: false
      t.boolean :root, null: false, default: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
