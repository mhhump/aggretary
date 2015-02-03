class AddDimensionsToDoors < ActiveRecord::Migration
  def change
    add_column :doors, :dim_a, :string
    add_column :doors, :dim_b, :string
    add_column :doors, :dim_c, :string
    add_column :doors, :dim_d, :string
    add_column :doors, :dim_e, :string
    add_column :doors, :dim_f, :string
    add_column :doors, :dim_g, :string
    add_column :doors, :dim_h, :string
    add_column :doors, :dim_i, :string
    add_column :doors, :dim_j, :string
    add_column :doors, :dim_k, :string
  end
end
