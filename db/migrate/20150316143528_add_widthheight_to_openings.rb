class AddWidthheightToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :width, :decimal
    add_column :openings, :height, :decimal
  end
end
