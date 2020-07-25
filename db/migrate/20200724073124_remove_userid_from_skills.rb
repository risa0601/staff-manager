class RemoveUseridFromSkills < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :skills, :users
    remove_index :skills, :user_id
    remove_reference :skills, :user
  end
end
