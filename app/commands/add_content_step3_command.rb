class AddContentStep3Command < BaseCommand 
  column :tags, :string 

  validates_presence_of :tags, :message => 'must be provided'
end
