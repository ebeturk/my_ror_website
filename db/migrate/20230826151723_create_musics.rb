class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.string :title
      t.text :description
      t.integer :type, default: 0, null: false
      t.string :genre
      t.string :url
      t.date :release_date
      t.string :album
      t.string :artist
      t.text :lyrics
      t.integer :plays, default: 0
      t.timestamps
    end
  end
end
