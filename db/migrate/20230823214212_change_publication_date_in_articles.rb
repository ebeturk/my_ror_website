class ChangePublicationDateInArticles < ActiveRecord::Migration[7.0]
  def up
    change_column :articles, :publication_date, 'date USING CAST(publication_date AS date)'
  end

  def down
    change_column :articles, :publication_date, :string
  end
end

