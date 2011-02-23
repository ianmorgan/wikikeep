class User < ActiveRecord::Base
  set_table_name 'site_users'
  belongs_to :account

  validates_presence_of :user_name, :family_name, :password_hash


  # Checks to see if there is a user who 
  # matches these credentials. Returns 
  # the User instance if matched else nil
  #
  # Note that password should be passed in the clear
  #
  def self.authenticate(user_name, password)
     # todo  - add hashing of password
     find(:first, :conditions => { :user_name  => user_name, :password_hash => password }) 
  end

end
