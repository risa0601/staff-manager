class RemoveUserIdFromSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :user_id, :integer
  end
end
