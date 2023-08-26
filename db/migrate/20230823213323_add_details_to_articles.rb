class AddDetailsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :content, :text
    add_column :articles, :summary, :text
    add_column :articles, :category, :integer
    add_column :articles, :tags, :string
    add_column :articles, :publication_date, :string
    add_column :articles, :date, :string
    add_column :articles, :views, :integer
  end
end
