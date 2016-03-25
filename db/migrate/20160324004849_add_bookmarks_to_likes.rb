class AddBookmarksToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :bookmark_id, :integer
  end
end
