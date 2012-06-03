class RemoveAuthor < ActiveRecord::Migration
  def up
    remove_column :comments, :author_url
    remove_column :comments, :author_email
  end

  def down
  end
end
