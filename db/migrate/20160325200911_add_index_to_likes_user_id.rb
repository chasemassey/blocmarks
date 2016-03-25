class AddIndexToLikesUserId < ActiveRecord::Migration
  def change
    add_index :likes, :user_id
  end
end
