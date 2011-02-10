class ContentItem < ActiveRecord::Base
  has_many :tags
  has_many :tags_data, :through => :tags, :source => :tag_data

  validates_presence_of :name, :content 
end
