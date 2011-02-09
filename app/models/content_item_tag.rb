class ContentItemTag < ActiveRecord::Base
  set_table_name 'content_items_tags'

  has_many :content_items 
  has_many :tags 
end
