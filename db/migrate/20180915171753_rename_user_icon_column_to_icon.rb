class RenameUserIconColumnToIcon < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :user_icon, :icon
  end
end
