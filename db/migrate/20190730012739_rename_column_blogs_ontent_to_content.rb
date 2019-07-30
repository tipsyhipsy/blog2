class RenameColumnBlogsOntentToContent < ActiveRecord::Migration[5.2]
  def change
    rename_column :blogs, :ontent, :content
  end
end
