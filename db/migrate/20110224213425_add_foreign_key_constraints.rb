class AddForeignKeyConstraints < ActiveRecord::Migration
  def self.up

 # not supported on sql lite
 #   execute <<-SQL
 #      ALTER TABLE content_items 
 #      ADD CONSTRAINT fk_content_items_accounts
 #      ADD FOREIGN KEY (account_id)
 #      REFERENCES accounts(id)
 #   SQL
  end

  def self.down
#     execute "ALTER TABLE content_items DROP FOREIGN KEY fk_content_items_accounts"
  end
end
