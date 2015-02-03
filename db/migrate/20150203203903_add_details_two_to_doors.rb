class AddDetailsTwoToDoors < ActiveRecord::Migration
  def change
    add_column :doors, :species, :string
    add_column :doors, :other_comments, :string
  end
end
