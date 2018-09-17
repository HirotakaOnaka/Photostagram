class RenameCommentColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :comment, :content
  end
end
