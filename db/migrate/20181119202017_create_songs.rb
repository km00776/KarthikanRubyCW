class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :description
      t.string :artist

      t.timestamps null: false
    end
  end
end
