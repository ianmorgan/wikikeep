class AddContentItemTagJoinTable < ActiveRecord::Migration
  def self.up
    create_table :content_items_tags do |t|
      t.column "content_item_id", :integer
      t.column "tag_id",          :integer
      t.column "created_at",      :datetime
      t.column "updated_at",      :datetime
    end

    # cannot have primary key on join tables
    remove_column :content_items_tags, :id

  end
 
  def self.down
    drop_table :content_items_tags 
    
  end
end

