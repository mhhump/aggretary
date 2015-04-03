class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.integer :number

      t.timestamps
    end
  end
end
