class AddAccountIdToUser < ActiveRecord::Migration
  def self.up
    add_column :site_users, :account_id, :integer
  end

  def self.down
    remove_column :site_users, :account_id
  end
end
