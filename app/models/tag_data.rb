class TagData < ActiveRecord::Base
 has_many :tags
 has_many :content_items, :through => :tags, :source => :content_item
 belongs_to :account

 def self.find_by_name(name)
    # ensures case insensitive match 
    TagData.find(:first, :conditions => [ "lower(name) = ?", name.downcase ])
 end

end
