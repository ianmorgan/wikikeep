class AddContentStep3Command < BasePoro2 
  attr_accessor :tags 

  validates_presence_of :tags, :message => 'must be provided'
end
