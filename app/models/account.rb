class Account < ActiveRecord::Base
  has_many :users
  has_many :content_items
  has_many :tag_datas

  validates_format_of :name, :with => /^[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]$/, :message => "Only letters, numbers and underscores allowed"
  validates_uniqueness_of :name, :case_sensitive => false, :message => 'Sorry. That account name is already in use' 


  def self.find_by_name(name)
    # ensures case insensitive match
    # will need to consider a more performant solution if volumes increase 
    Account.find(:first, :conditions => [ "lower(name) = ?", name.downcase ]) if name
  end
  
end
