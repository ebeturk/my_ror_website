class CreateCodeWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :code_works do |t|
      t.string :title
      t.text :description
      t.integer :project_type
      t.string :url
      t.date :date
      t.string :repository
      t.string :domain

      t.timestamps
    end
  end
end
