class AddTagTypeForTaggings < ActiveRecord::Migration
  def up
    change_table :taggings do |t|
      t.references :tagger, :polymorphic => true
      # limit is created to prevent mysql error o index lenght for myisam table type.
      # http://bit.ly/vgW2Ql
      t.string :context, :limit => 128
      
    end
  end

  def down
  end
end
