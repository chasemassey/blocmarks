class AddIndexToLikesBookmarkId < ActiveRecord::Migration
def change
    add_index :likes, :bookmark_id
  end
end
