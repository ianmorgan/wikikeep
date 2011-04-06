class TagData < ActiveRecord::Base
 set_table_name 'tag_datas'
 has_many :tags
 has_many :content_items, :through => :tags, :source => :content_item
 belongs_to :account

 validates_presence_of :account_id

 scope :for_account_id, lambda { |account_id| where("account_id = ?", account_id) }
 scope :named, lambda { |name| where("lower(name) = ?", name.downcase) }

 #def self.find_by_name(name)
 #   # ensures case insensitive match 
 #   TagData.find(:first, :conditions => [ "lower(name) = ?", name.downcase ])
 #end

end
