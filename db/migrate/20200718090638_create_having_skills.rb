class CreateHavingSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :having_skills do |t|
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :skill_id], unique: true
    end
  end
end
