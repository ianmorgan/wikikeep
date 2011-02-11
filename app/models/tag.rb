class Tag < ActiveRecord::Base
 belongs_to :content_item
 belongs_to :tag_data 
end

