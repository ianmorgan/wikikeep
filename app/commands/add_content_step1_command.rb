class AddContentStep1Command < BaseCommand 
  column :name, :string 

  validates_presence_of :name, :message => 'must be provided'
end
