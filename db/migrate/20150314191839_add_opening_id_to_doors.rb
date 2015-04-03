class AddOpeningIdToDoors < ActiveRecord::Migration
  def change
    add_column :doors, :opening_id, :integer
    add_index :doors, :opening_id
  end
end
