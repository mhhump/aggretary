class AddExistingFrameToDoors < ActiveRecord::Migration
  def change
    add_column :doors, :existing_frame, :string
  end
end
