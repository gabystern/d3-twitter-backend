class CreateCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :charts do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.string :main_color
      t.string :secondary_color

      t.timestamps
    end
  end
end
