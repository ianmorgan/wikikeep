class ContentItem < ActiveRecord::Base
  has_many :tags
  has_many :tags_data, :through => :tags, :source => :tag_data
  belongs_to :account
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by_user_id"

  validates_presence_of :name, :content, :account

  scope :for_account_id, lambda { |account_id| where("account_id = ?", account_id) }

  def markedup_content
    return "" if content.nil?
    
    r = RedCloth.new content
    r.to_html.html_safe    
  end
  

end
