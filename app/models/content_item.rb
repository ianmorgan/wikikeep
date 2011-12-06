class ContentItem < ActiveRecord::Base
  has_many :tags
  has_many :tags_data, :through => :tags, :source => :tag_data
  belongs_to :account
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by_user_id"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by_user_id"


  validates_presence_of :name, :content, :account

  scope :for_account_id, lambda { |account_id| where("account_id = ?", account_id) }
  
  scope :recent, order('updated_at').limit(5)

  def markedup_content
    return "" if content.nil?
    
    r = RedCloth.new content
    r.to_html.html_safe    
  end
  

end
