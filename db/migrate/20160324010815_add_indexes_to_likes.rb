class AddIndexesToLikes < ActiveRecord::Migration
  def change
    add_index "likes", ["bookmark_id"], name: "index_likes_on_bookmark_id"
    add_index "likes", ["user_id"], name: "index_likes_on_user_id"
  end
end
