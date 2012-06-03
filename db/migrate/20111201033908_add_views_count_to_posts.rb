class AddViewsCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :views_count, :int, :default => 0 
  end

  def self.down
  end
end
