class TagData < ActiveRecord::Base
 has_many :tags
 has_many :content_items, :through => :tags, :source => :content_item
 belongs_to :account

 validates_presence_of :account_id

 def self.find_by_name(name)
    # ensures case insensitive match 
    TagData.find(:first, :conditions => [ "lower(name) = ?", name.downcase ])
 end

end
