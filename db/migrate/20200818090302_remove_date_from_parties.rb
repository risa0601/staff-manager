class RemoveDateFromParties < ActiveRecord::Migration[5.0]
  def change
    remove_column :parties, :date, :date
  end
end
