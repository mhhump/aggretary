class AddDetailsToDoors < ActiveRecord::Migration
  def change
    add_column :doors, :measure_from, :string
    add_column :doors, :frame_material, :string
    add_column :doors, :door_material, :string
    add_column :doors, :location, :string
    add_column :doors, :swing, :string
    add_column :doors, :fire_rating, :string
    add_column :doors, :lock_prep, :string
    add_column :doors, :deadbolt_prep, :string
    add_column :doors, :lite_kit, :string
    add_column :doors, :louver, :string
  end
end
