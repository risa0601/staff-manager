class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.datetime :party_start
      t.string :station

      t.timestamps
    end
  end
end
