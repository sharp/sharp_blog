class AddTagType < ActiveRecord::Migration
  def up
    change_table :taggings do |t|
      t.string  "taggable_type"
    end 
  end

  def down
  end
end
