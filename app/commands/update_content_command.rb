class UpdateContentCommand < BaseCommand 
  column :id, :integer
  column :content, :string 

  validates_presence_of :content, :message => 'must be provided'
end
