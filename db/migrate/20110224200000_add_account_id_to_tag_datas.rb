class AddAccountIdToTagDatas < ActiveRecord::Migration
  def self.up
    add_column :tag_datas, :account_id, :integer
  end

  def self.down
    remove_column :tag_datas, :account_id
  end
end
