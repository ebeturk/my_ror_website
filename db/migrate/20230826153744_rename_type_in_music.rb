class RenameTypeInMusic < ActiveRecord::Migration[7.0]
  def change
    rename_column :musics, :type, :music_type
  end
end
