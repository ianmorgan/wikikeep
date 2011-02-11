class TagData < ActiveRecord::Base
 has_many :tags
 has_many :content_items, :through => :tags, :source => :tag_data

 def self.find_by_name(name)
    # ensures case insensite match 
    TagData.find(:first, :conditions => [ "lower(name) = ?", name.downcase ])
 end

end
