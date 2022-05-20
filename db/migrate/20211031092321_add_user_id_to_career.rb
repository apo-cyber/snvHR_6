class AddUserIdToCareer < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM careers;'
    add_reference :careers, :user, null: false, index: true
  end

  def down
    remove_referece :careers, :user, index: true
  end
end
