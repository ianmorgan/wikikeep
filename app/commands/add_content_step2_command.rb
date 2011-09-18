class AddContentStep2Command < BasePoro2 
  attr_accessor :content

  validates_presence_of :content, :message => 'must be provided'
end
