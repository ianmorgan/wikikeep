class TagData < ActiveRecord::Base
 has_many :tags
 has_many :content_items, :through => :tags, :source => :tag_data
end
