class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :address
      t.string :key
      t.integer :clicks_count
      t.timestamps
    end
  end
end
