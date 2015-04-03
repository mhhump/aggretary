class AddDetailsToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :swing, :string
    add_column :openings, :fire_rating, :string
    add_column :openings, :location_1, :string
    add_column :openings, :location_2, :string
  end
end
