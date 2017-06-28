class CreateGraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :graphs do |t|
      t.string :title
      t.integer :search_id

      t.timestamps
    end
  end
end
