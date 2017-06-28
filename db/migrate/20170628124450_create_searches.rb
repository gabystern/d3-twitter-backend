class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :title
      t.integer :account_id

      t.timestamps
    end
  end
end
