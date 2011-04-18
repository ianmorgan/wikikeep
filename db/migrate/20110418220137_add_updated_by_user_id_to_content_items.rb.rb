class AddUpdatedByUserIdToContentItems < ActiveRecord::Migration
  def self.up
     add_column :content_items, :updated_by_user_id, :integer
  end

  def self.down
    remove_column :content_items, :updated_by_user_id
  end
end
 