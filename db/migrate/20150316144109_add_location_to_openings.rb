class AddLocationToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :location, :string
  end
end
