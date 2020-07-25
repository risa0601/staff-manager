class AddDateToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :date, :date
  end
end
