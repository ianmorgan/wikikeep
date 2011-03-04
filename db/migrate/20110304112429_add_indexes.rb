class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :site_users, :user_name, {:name => 'users_name_index', :unique => true}
    add_index :tag_datas, :name, {:name => 'tag_data_name_index'}
  end

  def self.down
    #remove_index :site_users, :users_name_index
    #remove_index :tag_datas, :tag_data_name_index
  end
end
