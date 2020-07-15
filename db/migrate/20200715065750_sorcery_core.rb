class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :staff_no,            null: false
      t.string :crypted_password
      t.string :salt
      t.string :trip
      t.string :party_type
      t.boolean :admin, null: false, default: false

      t.timestamps                null: false
    end

  end
end
