class ContentItem < ActiveRecord::Base
  has_many :tags
  has_many :tags_data, :through => :tags, :source => :tag_data
  belongs_to :account

  validates_presence_of :name, :content, :account
end
