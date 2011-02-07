class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :site_users do |t|
      t.string :user_name, :given_names, :family_name, :password_hash
      t.timestamps
    end
  end

  def self.down
    drop_table :site_users
  end
end
