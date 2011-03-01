class AddContentStep2Command < BaseCommand 
  column :content, :string 

  validates_presence_of :content, :message => 'must be provided'
end
