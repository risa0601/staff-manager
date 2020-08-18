class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :adress, :text
    add_column :users, :phone, :string
    add_column :users, :memo, :text
    add_column :users, :position, :text
  end
end
