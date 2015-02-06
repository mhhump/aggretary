class AddProjectIdToDoors < ActiveRecord::Migration
  def change
    add_column :doors, :project_id, :integer
    add_index :doors, :project_id
  end
end
