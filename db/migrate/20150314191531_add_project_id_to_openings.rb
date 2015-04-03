class AddProjectIdToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :project_id, :integer
    add_index :openings, :project_id
  end
end
