class RenameProtopypeColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :protopype_id, :prototype_id
  end
end
