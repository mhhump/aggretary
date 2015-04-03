class AddUserIdToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :user_id, :integer
    add_index :openings, :user_id
  end
end
