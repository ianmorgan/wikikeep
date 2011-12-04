class UpdateContentCommand < BasePoro2
#  column :id, :integer
#  column :content, :string 
  attr_accessor :content
  validates_presence_of :content, :message => 'must be provided'
end
