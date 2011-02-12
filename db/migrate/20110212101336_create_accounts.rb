class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      #t.index :name, :name => 'idx_account_name', :unique => true 
      t.timestamps
    end
    add_index :accounts, :name, :name => 'idx_account_name', :unique => true
  end

  def self.down
    drop_table :accounts
  end
end
