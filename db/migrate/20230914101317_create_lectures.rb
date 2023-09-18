class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :description
      t.string :lecture_type
      t.string :content_type
      t.text :content_link

      t.timestamps
    end
  end
end
