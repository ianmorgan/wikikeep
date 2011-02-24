class AddAccountIdToContentItems < ActiveRecord::Migration
  def self.up
    add_column :content_items, :account_id, :integer
  end

  def self.down
    remove_column :content_items, :account_id
  end
end
