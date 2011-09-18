class AddContentStep1Command < BasePoro2 
  #column :name, :string 
  attr_accessor :name

  validates_presence_of :name, :message => 'must be provided'
end
