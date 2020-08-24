class CreateShiftDicisions < ActiveRecord::Migration[5.0]
  def change
    create_table :shift_dicisions do |t|
      t.references :user, foreign_key: true
      t.references :party, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :party_id], unique: true
    end
  end
end
