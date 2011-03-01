class AddContentStep1Command < BaseCommand 
  column :title, :string 

  validates_presence_of :title, :message => 'must be provided'

end
