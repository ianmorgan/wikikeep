class ContentItem < ActiveRecord::Base
  has_many :tags
  has_many :tags_data, :through => :tags, :source => :tag_data
  belongs_to :account

  validates_presence_of :name, :content, :account

  scope :for_account_id, lambda { |account_id| where("account_id = ?", account_id) }  

end
