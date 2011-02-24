#
# An attemt a command object pattern
# 
class ContentCommand  < BaseCommand
   
  column :name, :string
  column :content, :string
  column :tags, :string
   
  validates_presence_of :name, :content, :tags

end
