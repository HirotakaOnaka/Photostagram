class RenameIconColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :icon, :image
  end
end
