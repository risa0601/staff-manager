class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.date :date
      t.text :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
