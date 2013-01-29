class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table "bookmarks" do |t|
      t.string   "title"                                                     
      t.string   "url",                                                        :null => false
      t.string   "slug"                                                    
      t.text     "body"                                                       
      t.boolean  "active",                  :default => true,                  :null => false
      t.integer  "approved_comments_count", :default => 0,                     :null => false
      t.string   "cached_tag_list"
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "edited_at",                                                  :null => false
    end
  end
end
