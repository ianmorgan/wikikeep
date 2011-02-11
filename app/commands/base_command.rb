#
# A very simple command object pattern leveraging from 
# active record. A better implementation would 
# probably just mixin the necessary modules   
#  
class BaseCommand  < ActiveRecord::Base
   def self.columns() @columns ||= []; end
 
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end
  

end
