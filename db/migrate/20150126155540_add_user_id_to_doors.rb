class AddUserIdToDoors < ActiveRecord::Migration
  def change
    add_column :doors, :user_id, :integer
    add_index :doors, :user_id
  end
end
